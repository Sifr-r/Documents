# Architecture Ledger

## Overview

This repository provides modular, agent-first ground-truth reference documentation indexed via `@neuledge/context` for sub-10ms Model Context Protocol (MCP) lookups.

## Domain Modularity & Directory Structure

```
d:\Documents\
├── languages/         # Reference documentation for programming languages
├── frameworks/        # Reference documentation for web, backend, and AI frameworks & tools
│   └── comfyui/       # Native ComfyUI node execution engine, Custom Node API, & API docs
├── databases/         # Database engines, query languages, and ORMs
├── devops/            # DevOps, containerization, orchestration, and infrastructure tools
├── web-platform/      # Web Standards (HTML, CSS, Web APIs)
├── concepts/          # Cross-cutting software engineering concepts
├── _template/         # Blueprint directory for establishing new domains
└── scripts/           # Validation and setup helpers
```

## Single Responsibilities

| File / Component | Single Responsibility |
|---|---|
| `README.md` | Primary entry point and quick start instructions for developer tools and MCP setup |
| `LLMS.md` | Agent navigation guide mapping user queries to domain directories |
| `ARCHITECTURE.md` | Authoritative ledger of workspace structure, modularity patterns, and domain responsibilities |
| `frameworks/README.md` | Catalog of frontend, backend, AI, and testing framework reference documentation |
| `frameworks/comfyui/README.md` | Standardized domain overview, quick reference snippets, and topic index for ComfyUI |
| `frameworks/comfyui/core.md` | Ground-truth reference for Node Execution Engine, Custom Node API, REST/WebSocket endpoints, Prompt JSON, and CLI flags |
| `validate_links.ps1` | PowerShell link integrity and reference validator |
