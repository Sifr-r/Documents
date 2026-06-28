#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing Neuledge context..."
npm install -g @neuledge/context

echo "==> Indexing docs repository..."
context add .

echo "==> Done! Run 'context mcp' to start the MCP server."
echo "    Then configure your editor with mcp.json in this repo."
