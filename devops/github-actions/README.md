# GitHub Actions

GitHub Actions is a CI/CD platform integrated directly into GitHub repositories. It automates build, test, and deployment workflows using YAML configuration files stored in `.github/workflows/`.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Workflow syntax, triggers, jobs, steps, actions, caching, artifacts, runners |

## Quick Reference

### Basic Workflow

```yaml
name: CI
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm test
```

### Matrix Strategy

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node: [18, 20, 22]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
      - run: npm ci
      - run: npm test
```

### Secrets and Environment Variables

```yaml
steps:
  - run: deploy.sh
    env:
      API_KEY: ${{ secrets.API_KEY }}
      DEPLOY_ENV: production
```

### Artifacts

```yaml
steps:
  - run: npm run build
  - uses: actions/upload-artifact@v4
    with:
      name: dist
      path: dist/
```

### Reusable Secrets Reference

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - run: echo "Deploying to production"
        env:
          TOKEN: ${{ secrets.DEPLOY_TOKEN }}
```
