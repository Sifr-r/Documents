# HTTP

## Methods

| Method | Safe | Idempotent | Body | Use |
|---|---|---|---|---|
| GET | Yes | Yes | No | Retrieve resource |
| HEAD | Yes | Yes | No | Like GET without body |
| POST | No | No | Yes | Create resource / trigger action |
| PUT | No | Yes | Yes | Replace or create at known URI |
| PATCH | No | No | Yes | Partial update |
| DELETE | No | Yes | May | Remove resource |
| OPTIONS | Yes | Yes | No | Describe communication options |

## Status Codes

| Range | Meaning |
|---|---|
| 1xx | Informational |
| 2xx | Success |
| 3xx | Redirection |
| 4xx | Client Error |
| 5xx | Server Error |

**Essential codes:**

| Code | Name | When |
|---|---|---|
| 200 | OK | Successful GET, PUT, PATCH |
| 201 | Created | Successful POST (return Location header) |
| 204 | No Content | Successful DELETE, no body |
| 301 | Moved Permanently | URL changed forever |
| 302 | Found | Temporary redirect |
| 304 | Not Modified | Cached version still valid |
| 400 | Bad Request | Malformed input |
| 401 | Unauthorized | Missing/invalid credentials |
| 403 | Forbidden | Authenticated but not allowed |
| 404 | Not Found | Resource doesn't exist |
| 409 | Conflict | Resource state conflict |
| 422 | Unprocessable Entity | Semantic validation error |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Internal Server Error | Unexpected server failure |
| 502 | Bad Gateway | Upstream server error |
| 503 | Service Unavailable | Overloaded / maintenance |

## Headers

```http
# Request
Authorization: Bearer <token>
Content-Type: application/json
Accept: application/json
If-None-Match: "abc123"          # conditional GET (ETag)
Cache-Control: no-cache
User-Agent: MyApp/1.0

# Response
Content-Type: application/json
ETag: "abc123"                    # resource version
Cache-Control: public, max-age=3600
Location: /users/42               # after 201 Created
Set-Cookie: session=xyz; HttpOnly; Secure; SameSite=Lax
Access-Control-Allow-Origin: *
Retry-After: 120                  # with 429/503
```

## CORS (Cross-Origin Resource Sharing)

```http
# Preflight (OPTIONS) response
Access-Control-Allow-Origin: https://app.example.com
Access-Control-Allow-Methods: GET, POST, PUT, DELETE
Access-Control-Allow-Headers: Content-Type, Authorization
Access-Control-Max-Age: 86400    # cache preflight (seconds)
Access-Control-Allow-Credentials: true  # if sending cookies
```

Simple requests (GET, POST, HEAD with simple headers) skip preflight.
All others trigger an OPTIONS preflight first.

## Authentication Patterns

```http
# Bearer token (JWT)
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...

# Basic (base64 encoded user:pass — use only over HTTPS)
Authorization: Basic dXNlcjpwYXNz

# API Key
X-API-Key: sk-abc123
```

**Best practices:**
- Never put tokens in URLs (logged, cached, shared)
- Use `HttpOnly; Secure; SameSite=Strict` cookies for browser sessions
- Rotate refresh tokens on use (detect token theft)

## Content Negotiation

```http
GET /users/42 HTTP/1.1
Accept: application/json, text/html;q=0.9

HTTP/1.1 200 OK
Content-Type: application/json
Vary: Accept  # tells caches response varies by Accept header
```

## Conditional Requests

```http
# ETag (entity tag) — exact version match
GET /users/42 HTTP/1.1
If-None-Match: "abc123"
# → 304 Not Modified (client has latest)

# Last-Modified — time-based
GET /users/42 HTTP/1.1
If-Modified-Since: Mon, 22 Jun 2026 10:00:00 GMT
# → 304 Not Modified (no changes since)
```

## See Also

- Web API docs in [web-apis.md](../web-platform/web-apis.md) — Fetch API
- REST API design patterns
