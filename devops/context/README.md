# @neuledge/context

`@neuledge/context` is a local-first documentation server for AI coding assistants (like Claude Code, Cursor, and VS Code Copilot). It indexes library documentation into a portable SQLite database (`.db`) and serves it via the Model Context Protocol (MCP) with sub-10ms response times.

## Topics

| Topic | File | Description |
|---|---|---|
| Core | [core.md](core.md) | CLI commands, installation, MCP server configuration, and integration options |

## Quick Reference

### CLI Installation

```bash
npm install -g @neuledge/context
```

### Common Commands

```bash
# Add/index documentation from a Git repository
context add https://github.com/vercel/next.js

# Add/index documentation from a website via llms.txt
context add https://react-aria.adobe.com

# Start the MCP server (stdio transport)
context serve

# Start the server as an HTTP/SSE server (for team setups)
context serve --http 3000
```

### Connecting to AI Agents (Cursor / VS Code)

Add this to `.cursor/mcp.json` or `.vscode/mcp.json`:

```json
{
  "mcpServers": {
    "context": {
      "command": "context",
      "args": ["serve"]
    }
  }
}
```
