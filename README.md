# docs — Agent-First Language Documentation

A modular, standalone repository of programming language and platform documentation,
optimized for consumption by AI coding assistants (LLMs) via
[Neuledge](https://neuledge.com).

## Why This Exists

LLMs are only as good as the docs they have access to. Training data is stale,
context windows are limited, and hallucinated APIs waste time. This repo provides
**ground truth** — accurate, versioned, concise reference docs that an agent can
query in milliseconds.

## Structure

```
languages/          # 28 programming languages (JS, Python, Rust, Go, Java, C#, …)
frameworks/         # 33 web frameworks & libraries (React, Vue, Next.js, Nuxt, Hono, Cypress, Playwright, Jest, Vitest, Zustand, …)
databases/          # 8 databases & ORMs (PostgreSQL, MongoDB, Redis, Prisma, Vector DBs, …)
devops/             # 8 DevOps tools (Docker, Kubernetes, Terraform, Nginx, Context, Graph, …)
web-platform/       # HTML, CSS, Web APIs
concepts/           # Cross-cutting topics (HTTP, Git, Testing, Databases …)
_template/          # Copy this to add a new domain
scripts/            # Setup and build helpers
```

Every domain is **self-contained** — add or remove a directory without affecting
anything else.

## Quick Start

### 1. Install Neuledge

```bash
npm install -g @neuledge/context
```

### 2. Index This Repo

```bash
context add .
```

This parses all Markdown files and builds a portable `neuledge.db` with full-text search.

### 3. Start the MCP Server

```bash
context mcp
```

### 4. Connect Your Agent

**Claude Code:**
```bash
claude mcp add docs -- npx @neuledge/context mcp
```

**Cursor / VS Code** — add to `settings.json`:
```json
{
  "mcpServers": {
    "docs": { "command": "npx", "args": ["@neuledge/context", "mcp"] }
  }
}
```

Your AI assistant now has instant access to all docs in this repo.

## Adding a New Domain

```bash
cp -r _template languages/rust    # or any domain name
# Edit the README and add .md files
context add .                      # re-index
```

## Conventions

- **One file per topic** — keeps context windows small and relevant
- **Markdown only** — what Neuledge indexes best
- **Reference style** — concise, factual, no tutorials or marketing fluff
- **Code examples on every concept** — LLMs learn best from examples

## License

MIT
