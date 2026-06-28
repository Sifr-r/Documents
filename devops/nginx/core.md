# Nginx — Core

## Core Directives

```nginx
user nginx;                        # Worker process user
worker_processes auto;             # auto = number of CPU cores
error_log /var/log/nginx/error.log warn;
pid /run/nginx.pid;

events {
    worker_connections 1024;       # Max connections per worker
    multi_accept on;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    sendfile on;
    keepalive_timeout 65;
    access_log /var/log/nginx/access.log;

    # Include server blocks
    include /etc/nginx/conf.d/*.conf;
}
```

## Server Blocks

```nginx
server {
    listen 80;
    listen [::]:80;                    # IPv6
    server_name example.com www.example.com;

    root /var/www/html;
    index index.html index.htm;

    # Default server (catch-all)
    # listen 80 default_server;

    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
}
```

## Location Blocks

```nginx
# Priority order: exact (=) > preferential prefix (^~) > regex (~*) > prefix
location = /exact { }              # Exact match only
location ^~ /static { }            # Prefix, skip regex check
location ~ \.(jpg|png|gif)$ { }   # Case-sensitive regex
location ~* \.(css|js)$ { }       # Case-insensitive regex
location /prefix { }               # Prefix match (lowest priority)

# Common patterns
location / {
    try_files $uri $uri/ /index.html;  # SPA fallback
}

location /api {
    proxy_pass http://localhost:3000;  # Strip /api prefix with trailing /
}

location /api/ {
    proxy_pass http://localhost:3000/; # /api/users -> /users
}

location = /health {
    return 200 'ok';
    add_header Content-Type text/plain;
}
```

## Reverse Proxy

```nginx
location /app {
    proxy_pass http://backend;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;

    proxy_connect_timeout 10s;
    proxy_read_timeout 30s;
    proxy_send_timeout 30s;

    # Buffering
    proxy_buffering on;
    proxy_buffer_size 4k;
    proxy_buffers 8 4k;
}
```

## Load Balancing

```nginx
upstream backend {
    # Round-robin (default)
    server 10.0.0.1:3000 weight=3;
    server 10.0.0.2:3000 weight=1;
    server 10.0.0.3:3000 backup;     # Only used when others fail

    # Methods (choose one):
    # least_conn;                    # Fewest active connections
    # ip_hash;                       # Sticky sessions by IP
    # hash $request_uri consistent;  # Consistent hashing

    keepalive 32;                    # Keep-alive connections to upstream
}

server {
    location / {
        proxy_pass http://backend;
        proxy_next_upstream error timeout http_502 http_503;
    }
}
```

| Method | Behavior |
|--------|----------|
| round-robin | Default, distributes evenly |
| least_conn | Sends to server with fewest connections |
| ip_hash | Same client IP → same server |
| hash | Hash-based routing (consistent) |

## SSL/TLS

```nginx
server {
    listen 443 ssl;
    http2 on;
    server_name example.com;

    ssl_certificate /etc/ssl/certs/example.com.pem;
    ssl_certificate_key /etc/ssl/private/example.com.key;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    # OCSP stapling
    ssl_stapling on;
    ssl_stapling_verify on;
    resolver 8.8.8.8 8.8.4.4;

    location / {
        root /var/www/html;
    }
}

# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name example.com;
    return 301 https://$host$request_uri;
}
```

### Let's Encrypt with certbot

```bash
sudo certbot --nginx -d example.com -d www.example.com
# Auto-renewal: certbot renew --dry-run
```

## Caching

```nginx
# Define cache zone
proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=app_cache:10m
                 max_size=1g inactive=60m;

server {
    location /api {
        proxy_cache app_cache;
        proxy_cache_valid 200 10m;
        proxy_cache_valid 404 1m;
        proxy_cache_use_stale error timeout updating;
        add_header X-Cache-Status $upstream_cache_status;

        proxy_pass http://backend;
    }

    # Static file caching
    location ~* \.(css|js|jpg|png|gif|ico|svg)$ {
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
}
```

## Rate Limiting

```nginx
# Define zones (in http block)
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
limit_conn_zone $binary_remote_addr zone=conn:10m;

server {
    # Request rate limiting
    location /api {
        limit_req zone=api burst=20 nodelay;
        limit_req_status 429;
        proxy_pass http://backend;
    }

    # Connection limiting
    location /downloads {
        limit_conn conn 10;
    }
}
```

## Gzip Compression

```nginx
gzip on;
gzip_vary on;
gzip_proxied any;
gzip_comp_level 6;
gzip_min_length 256;
gzip_types
    text/plain
    text/css
    text/javascript
    application/json
    application/javascript
    application/xml
    image/svg+xml;
```

## WebSocket Proxying

```nginx
map $http_upgrade $connection_upgrade {
    default upgrade;
    ''      close;
}

server {
    location /ws {
        proxy_pass http://backend;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
        proxy_read_timeout 86400s;    # 24h for long-lived connections
    }
}
```

## Security Headers

```nginx
add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-Content-Type-Options "nosniff" always;
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
add_header Content-Security-Policy "default-src 'self'" always;
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
add_header Permissions-Policy "camera=(), microphone=(), geolocation=()" always;

# Hide version
server_tokens off;

# Block sensitive files
location ~ /\. {
    deny all;
}
```

## See Also

- [Nginx Documentation](https://nginx.org/en/docs/)
- [Nginx Core Module](https://nginx.org/en/docs/ngx_core_module.html)
- [Nginx HTTP Module](https://nginx.org/en/docs/http/ngx_http_core_module.html)
- [Let's Encrypt with Nginx](https://certbot.eff.org/instructions?ws=nginx)
