# LLMS.md — Agent Navigation Guide

> This file is the entry point for AI agents exploring this repository.
> When an agent needs documentation on a language, platform, or concept,
> it should read the relevant `README.md` in the domain directory first,
> then drill into specific topic files.

## Repository Purpose

This repo is a **ground-truth documentation source** for AI coding assistants.
It is designed to be indexed by Neuledge (`@neuledge/context`) and served via
the Model Context Protocol (MCP) for sub-10ms lookups.

## How to Navigate

### 1. Find the Right Domain

| Directory | Covers |
|---|---|
| `languages/` | 28 programming languages: JS, TS, Python, Rust, Go, Java, C#, C++, Kotlin, Swift, Ruby, PHP, Scala, Dart, Lua, Bash, Elixir, Haskell, Clojure, Zig, Julia, R, Erlang, Groovy, Solidity, OCaml, F#, V |
| `frameworks/` | 33 web frameworks & libraries: React, Vue, Angular, Svelte, Next.js, Nuxt, Remix, SolidJS, Astro, Qwik, Tailwind, htmx, Django, Flask, FastAPI, Rails, Laravel, Spring Boot, Express, NestJS, Fastify, Gin, Phoenix, Actix, Hono, LangChain, Cypress, Playwright, Jest, Vitest, React Aria, React Router, Zustand |
| `databases/` | 8 databases & ORMs: PostgreSQL, MySQL, SQLite, MongoDB, Redis, Prisma, Drizzle, Vector DBs |
| `devops/` | 8 DevOps tools: Docker, Kubernetes, GitHub Actions, Terraform, Nginx, GraphQL, Context, Graph |
| `web-platform/` | HTML elements, CSS properties, Web APIs |
| `concepts/` | HTTP, Git, testing, databases |

### 2. Read the Domain README

Each domain has a `README.md` that lists all available topics with a one-line
description. Use it as a table of contents. Subdirectories like `frameworks/react/`
or `databases/postgresql/` also have their own README with a quick reference section.

### 3. Read Specific Topic Files

Topic files (e.g., `async.md`, `core.md`, `ownership.md`) contain reference-style
documentation with code examples. They are designed to be consumed in a single
context window.

## Neuledge Setup

When the user wants to connect this repo to their agent:

1. Ensure `@neuledge/context` is installed: `npm install -g @neuledge/context`
2. From the repo root, run: `context add .`
3. Start MCP: `context mcp`
4. Point the MCP client to the server

See [README.md](README.md) for editor-specific configuration.

## Conventions

- All files are Markdown (`.md`) — this is what Neuledge indexes
- Domain directories are self-contained and independent
- The `_template/` directory is the blueprint for adding new domains
- Code examples use fenced code blocks with language identifiers
- Topic files target 100–300 lines for optimal context window usage

## File Discovery

To list available topics in a domain:
```bash
ls languages/javascript/
ls frameworks/react/
ls databases/postgresql/
ls devops/docker/
```

To search for a concept across all docs:
```bash
grep -r "async iterator" --include="*.md"
```

To find all READMEs (domain entry points):
```bash
find . -name "README.md" | sort
```
