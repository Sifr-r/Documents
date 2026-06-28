# DevOps & Tools

Reference documentation for DevOps tools, CI/CD, infrastructure, and API technologies.

## Containerization & Orchestration

| Tool | Description | Directory |
|---|---|---|
| Docker | Containerization platform | [docker/](docker/) |
| Kubernetes | Container orchestration (K8s) | [kubernetes/](kubernetes/) |

## CI/CD & Infrastructure

| Tool | Description | Directory |
|---|---|---|
| GitHub Actions | CI/CD automation | [github-actions/](github-actions/) |
| Terraform | Infrastructure as code | [terraform/](terraform/) |

## Web Servers & APIs

| Tool | Description | Directory |
|---|---|---|
| Nginx | Web server and reverse proxy | [nginx/](nginx/) |
| GraphQL | Query language for APIs | [graphql/](graphql/) |

## Quick Reference

```yaml
# Docker
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]

# GitHub Actions
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm test

# Kubernetes
kubectl get pods -n production
kubectl apply -f deployment.yaml
kubectl rollout restart deployment/my-app
```