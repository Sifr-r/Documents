# GitHub Actions — Core

## Workflow Syntax

```yaml
name: CI/CD Pipeline
on:
  push:
    branches: [main, develop]
    paths:
      - 'src/**'
      - '!docs/**'
  pull_request:
    branches: [main]

env:
  NODE_ENV: test

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm run build
```

## Triggers

```yaml
on:
  push:
    branches: [main]
    tags: ['v*']
  pull_request:
    branches: [main]
    types: [opened, synchronize, reopened]
  schedule:
    - cron: '0 6 * * 1'              # Weekly Monday 6am UTC
  workflow_dispatch:                   # Manual trigger
    inputs:
      environment:
        description: 'Target environment'
        required: true
        type: choice
        options: [staging, production]
  repository_dispatch:                 # Triggered via API
    types: [deploy]
  workflow_run:                        # After another workflow
    workflows: ["CI"]
    types: [completed]
```

## Jobs

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    timeout-minutes: 15

  deploy:
    runs-on: ubuntu-latest
    needs: [test, lint]                # Depends on other jobs
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    environment: production            # Environment with approvals

  matrix-job:
    runs-on: ${{ matrix.os }}
    strategy:
      fail-fast: false
      matrix:
        os: [ubuntu-latest, windows-latest]
        node: [18, 20]
        include:
          - os: ubuntu-latest
            node: 22
            experimental: true
    continue-on-error: ${{ matrix.experimental || false }}
```

## Steps

```yaml
steps:
  - uses: actions/checkout@v4

  - uses: actions/setup-node@v4
    with:
      node-version: 20
      cache: npm

  - name: Install dependencies
    run: npm ci

  - name: Run tests
    run: npm test
    env:
      CI: true

  - name: Conditional step
    if: failure()
    run: echo "Tests failed"

  - name: Multi-line script
    run: |
      echo "Building..."
      npm run build
      echo "Done"
```

## Actions

```yaml
# Official actions
- uses: actions/checkout@v4
- uses: actions/setup-node@v4
- uses: actions/setup-python@v5
- uses: actions/cache@v4

# Community actions
- uses: docker/setup-buildx-action@v3
- uses: aws-actions/configure-aws-credentials@v4

# Custom action from same repo
- uses: ./.github/actions/deploy
  with:
    environment: production
```

### Composite Action (`.github/actions/deploy/action.yml`)

```yaml
name: Deploy
description: Deploy application
inputs:
  environment:
    description: Target environment
    required: true
runs:
  using: composite
  steps:
    - run: echo "Deploying to ${{ inputs.environment }}"
      shell: bash
    - run: ./scripts/deploy.sh ${{ inputs.environment }}
      shell: bash
```

## Context and Expressions

```yaml
# Available contexts
${{ github.sha }}              # Commit SHA
${{ github.ref }}              # Branch/tag ref
${{ github.event_name }}       # Trigger event
${{ github.actor }}            # User who triggered
${{ github.repository }}       # owner/repo
${{ env.MY_VAR }}              # Environment variables
${{ secrets.API_KEY }}         # Repository secrets
${{ matrix.node }}             # Matrix value
${{ needs.build.outputs.artifact }}  # Job output
${{ steps.build.outputs.url }} # Step output
${{ runner.os }}               # Runner OS

# Expressions
${{ github.ref == 'refs/heads/main' }}
${{ contains(github.event.head_commit.message, 'deploy') }}
${{ startsWith(github.ref, 'refs/tags/') }}
${{ success() }}
${{ failure() || cancelled() }}
```

## Caching

```yaml
- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: npm-${{ runner.os }}-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      npm-${{ runner.os }}-

# Built-in cache for setup actions
- uses: actions/setup-node@v4
  with:
    node-version: 20
    cache: npm                # npm | yarn | pnpm
```

## Artifacts

```yaml
# Upload
- uses: actions/upload-artifact@v4
  with:
    name: build-output
    path: dist/
    retention-days: 7

# Download in another job
- uses: actions/download-artifact@v4
  with:
    name: build-output
    path: dist/
```

## Environments and Approvals

```yaml
jobs:
  deploy-production:
    runs-on: ubuntu-latest
    environment:
      name: production
      url: https://app.example.com
    steps:
      - run: ./deploy.sh
        env:
          SECRET: ${{ secrets.PROD_SECRET }}
```

Configure required reviewers and wait timers in repository Settings → Environments.

## Reusable Workflows

```yaml
# .github/workflows/reusable-test.yml
on:
  workflow_call:
    inputs:
      node-version:
        required: true
        type: string
    secrets:
      api-key:
        required: false

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ inputs.node-version }}
      - run: npm ci && npm test
```

```yaml
# Calling workflow
jobs:
  test:
    uses: ./.github/workflows/reusable-test.yml
    with:
      node-version: '20'
    secrets:
      api-key: ${{ secrets.API_KEY }}
```

## Self-Hosted Runners

```yaml
jobs:
  build:
    runs-on: self-hosted           # Single runner
    # runs-on: [self-hosted, linux, x64, gpu]  # Labels
```

```bash
# Register runner
./config.sh --url https://github.com/owner/repo --token TOKEN
# Run as service
sudo ./svc.sh install
sudo ./svc.sh start
```

## See Also

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Workflow Syntax Reference](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
- [Context and Expressions](https://docs.github.com/en/actions/learn-github-actions/contexts)
- [Creating Actions](https://docs.github.com/en/actions/creating-actions)
