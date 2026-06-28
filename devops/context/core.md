# Context — CLI & Configuration Reference

`@neuledge/context` manages local-first documentation databases (`.db` files stored in `~/.context/packages/`) and serves them via the Model Context Protocol (MCP).

## Command Line Interface (CLI)

```bash
context <command> [options]
```

### `context add`
Builds and indexes a documentation package from a local or remote source.

```bash
context add <source> [options]
```
- `<source>` can be:
  - Git repository URL (e.g. `https://github.com/vercel/next.js`)
  - Git tree/tag URL (e.g. `https://github.com/vercel/next.js/tree/v15.0.0`)
  - Local directory path (e.g. `./my-project`)
  - Website URL (will auto-discover `llms.txt` and ingest links)
- **Options:**
  - `--name <name>`: Custom library/package name
  - `--version <version>`: Specify package version
  - `--force`: Rebuild package even if it already exists

### `context serve`
Starts the MCP server.

```bash
context serve [options]
```
- **Options:**
  - `--port <number>`: Port to run on (when using HTTP/SSE)
  - `--http <port>`: Start an HTTP/SSE server on the specified port instead of standard input/output (stdio)
  - `--db-path <path>`: Custom directory path for SQLite databases

### `context list`
Lists all currently installed documentation packages.

```bash
context list
```

### `context remove`
Removes an installed documentation package.

```bash
context remove <name>
```

### `context query`
Run a direct query against installed documentation.

```bash
context query <library> <topic>
```
- Example: `context query npm/react "hooks"`

### `context browse`
Searches the community registry for pre-built packages.

```bash
context browse <package>
```
- Example: `context browse npm/react`

### `context install`
Downloads and installs a package from the community registry.

```bash
context install <package> [version]
```
- Example: `context install npm/react@latest`

### `context auth`
Manages headers, cookies, and tokens for private documentation repositories and sites.

```bash
context auth [options]
```

---

## Editor & Agent Configuration

### 1. Claude Code
Add the server globally:
```bash
claude mcp add context -- context serve
```

### 2. Claude Desktop
Add to your `claude_desktop_config.json`:
- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`
- **Linux**: `~/.config/claude/claude_desktop_config.json`

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

### 3. Cursor
Add to your global (`~/.cursor/mcp.json`) or project-specific (`.cursor/mcp.json`) configuration:
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

### 4. VS Code (GitHub Copilot)
Requires VS Code 1.102+ with GitHub Copilot extension. Add to `.vscode/mcp.json`:
```json
{
  "servers": {
    "context": {
      "type": "stdio",
      "command": "context",
      "args": ["serve"]
    }
  }
}
```

### 5. Zed
Add to your `settings.json`:
```json
{
  "context_servers": {
    "context": {
      "command": {
        "path": "context",
        "args": ["serve"]
      }
    }
  }
}
```

## See Also
- [Context GitHub Repository](https://github.com/neuledge/context)
- [Official Documentation](https://neuledge.com/docs)
