# Setup Script (Windows PowerShell)

Write-Output "==> Installing Neuledge context..."
npm install -g @neuledge/context

Write-Output "==> Indexing docs repository..."
context add .

Write-Output "==> Done! Run 'context mcp' to start the MCP server."
Write-Output "    Then configure your editor with mcp.json in this repo."
