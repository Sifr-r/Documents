# Docker

Docker is a containerization platform for building, shipping, and running applications in isolated environments. Docker 24+ supports BuildKit by default, multi-platform builds, and compose profiles.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Dockerfile instructions, image building, containers, volumes, networks, compose |

## Quick Reference

### Dockerfile

```dockerfile
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
EXPOSE 3000
USER node
CMD ["node", "dist/index.js"]
```

### Build and Run

```bash
docker build -t myapp:latest .
docker run -d --name myapp -p 3000:3000 -v data:/app/data myapp:latest
docker logs -f myapp
docker exec -it myapp sh
```

### Docker Compose

```yaml
services:
  web:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - ./src:/app/src
    depends_on:
      - db
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_PASSWORD: secret
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```

### Useful Commands

```bash
docker compose up -d          # Start services
docker compose down -v        # Stop and remove volumes
docker system prune -af       # Remove unused data
docker image ls               # List images
docker volume ls              # List volumes
```
