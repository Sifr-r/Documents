# Docker — Core

## Dockerfile Instructions

```dockerfile
# Base image (required, must be first)
FROM node:20-alpine
# Execute command during build (new layer)
RUN apk add --no-cache git
# Copy from host (build context)
COPY package.json ./
# Copy + auto-extract archives + URL support
ADD archive.tar.gz /opt
# Set working directory
WORKDIR /app
# Set environment variable
ENV NODE_ENV=production
# Document port (does not publish)
EXPOSE 3000
# Switch user (non-root best practice)
USER node
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/ || exit 1
# Default command (overridable)
CMD ["node", "index.js"]
# Executable (not overridable without --entrypoint)
ENTRYPOINT ["node"]
```

**CMD vs ENTRYPOINT:**
- `CMD` — default args, overridden by `docker run <cmd>`
- `ENTRYPOINT` — main executable, args appended
- Combined: `ENTRYPOINT ["node"]` + `CMD ["index.js"]`

## Image Building

```bash
docker build -t myapp:1.0 .           # Build with tag
docker build -f docker/Dockerfile .    # Custom Dockerfile path
docker build --build-arg VERSION=1.0 . # Pass build arguments
docker build --no-cache .              # Force rebuild all layers
docker tag myapp:1.0 registry/myapp:1.0
docker push registry/myapp:1.0
```

### Multi-stage Build

```dockerfile
# Stage 1: Build
FROM golang:1.22 AS builder
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o /app/server ./cmd/server

# Stage 2: Runtime
FROM alpine:3.19
COPY --from=builder /app/server /usr/local/bin/server
EXPOSE 8080
USER nobody
ENTRYPOINT ["server"]
```

### .dockerignore

```
.git
node_modules
*.log
.env
docker-compose*.yml
Dockerfile
```

## Container Management

```bash
docker run -d --name web \         # Run detached
  -p 8080:3000 \                   # Port mapping host:container
  -v mydata:/app/data \            # Named volume
  -v $(pwd)/src:/app/src \         # Bind mount
  -e NODE_ENV=production \         # Environment variable
  --env-file .env \                # Environment file
  --memory 512m \                  # Memory limit
  --cpus 1.5 \                     # CPU limit
  --restart unless-stopped \       # Restart policy
  myapp:latest

docker start myapp                 # Start stopped container
docker stop myapp                  # Graceful stop (SIGTERM + SIGKILL)
docker rm -f myapp                 # Force remove
docker logs -f --tail 100 myapp    # Follow logs
docker exec -it myapp sh           # Interactive shell
docker stats myapp                 # Resource usage
docker inspect myapp               # Detailed JSON info
docker cp myapp:/app/data ./backup # Copy from container
```

## Volumes

```bash
docker volume create mydata        # Named volume (managed by Docker)
docker volume ls
docker volume prune                # Remove unused volumes
docker run -v mydata:/data myapp   # Named volume mount
docker run -v $(pwd):/app myapp    # Bind mount (host path)
docker run --tmpfs /tmp myapp      # tmpfs mount (memory only)
```

| Type | Location | Use Case |
|------|----------|----------|
| Named volume | `/var/lib/docker/volumes/` | Persistent data, databases |
| Bind mount | Host path | Development, config files |
| tmpfs | Host memory | Secrets, temp files |

## Networks

```bash
docker network create mynet                # Create bridge network
docker run --network mynet --name web myapp
docker run --network mynet --name db postgres
# Containers on same network resolve by name: web can reach db:5432
```

| Driver | Use Case |
|--------|----------|
| bridge | Default, isolated containers on same host |
| host | Remove network isolation, use host ports directly |
| overlay | Multi-host networking (Swarm/K8s) |
| none | No network access |

## Docker Compose

```yaml
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
      target: production
    ports:
      - "3000:3000"
    volumes:
      - ./src:/app/src
    environment:
      - DATABASE_URL=postgres://user:pass@db:5432/app
    depends_on:
      db:
        condition: service_healthy
    profiles:
      - dev
    restart: unless-stopped

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: app
    volumes:
      - pgdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s

volumes:
  pgdata:

networks:
  default:
    driver: bridge
```

```bash
docker compose up -d              # Start all services
docker compose up web             # Start specific service
docker compose down -v            # Stop and remove volumes
docker compose logs -f web        # Follow logs for service
docker compose exec web sh        # Execute in running service
docker compose --profile dev up   # Start with profile
```

## Best Practices

- **Layer caching**: put rarely-changing layers first (deps install, then code copy)
- **Non-root user**: always add `USER` instruction
- **Slim images**: use `alpine`, `slim`, or `distroless` base images
- **.dockerignore**: exclude `node_modules`, `.git`, logs, `.env`
- **Multi-stage builds**: separate build tools from runtime image
- **Pin versions**: `node:20.11-alpine` not `node:latest`
- **Combine RUN**: chain commands with `&&` to reduce layers
- **HEALTHCHECK**: always define for production services

## Docker Buildx

```bash
docker buildx create --name mybuilder --use
docker buildx build --platform linux/amd64,linux/arm64 -t myapp:1.0 .
docker buildx build --cache-from type=registry,ref=myapp:cache \
                    --cache-to type=registry,ref=myapp:cache,mode=max .
```

```dockerfile
# Cache mounts for package managers
RUN --mount=type=cache,target=/root/.npm \
    npm ci
```

## See Also

- [Docker Documentation](https://docs.docker.com)
- [Dockerfile Reference](https://docs.docker.com/reference/dockerfile/)
- [Compose Specification](https://docs.docker.com/compose/compose-file/)
- [Docker Buildx](https://docs.docker.com/buildx/working-with-buildx/)
