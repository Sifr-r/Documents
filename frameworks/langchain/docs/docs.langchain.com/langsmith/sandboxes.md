# sandboxes

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# LangSmith Sandboxes

> Use LangSmith managed sandboxes to safely execute code and interact with the filesystem in isolated environments.

Sandboxes are isolated environments that allow agents to safely execute potentially risky operations—like running arbitrary code or interacting with the filesystem—without affecting your main infrastructure.

From the [LangSmith homepage](https://smith.langchain.com?utm_source=docs\&utm_medium=cta\&utm_campaign=langsmith-signup\&utm_content=langsmith-sandboxes), select **Sandboxes** to manage all your sandbox resources.

<img src="https://mintcdn.com/langchain-5e9cc07a/5nd3ca6haxRbnJZj/images/langsmith/sandboxes/sb-overview.png?fit=max&auto=format&n=5nd3ca6haxRbnJZj&q=85&s=6c2848ea69c0a99cbdd0930ceb91daa5" alt="Sandboxes overview page" width="2846" height="1936" data-path="images/langsmith/sandboxes/sb-overview.png" />

## Get started

### 1. Install the SDK

  ```bash Python theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
  # uv
  uv add "langsmith[sandbox]"

  # pip
  pip install "langsmith[sandbox]"
  ```

  ```bash TypeScript theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
  npm install langsmith
  ```

### 2. Set your API key

```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
export LANGSMITH_API_KEY="<your-api-key>"
```

### 3. Create and run a sandbox

  ```python Python theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
  from langsmith.sandbox import SandboxClient

  client = SandboxClient()

  with client.sandbox() as sb:
      result = sb.run("python -c 'print(2 + 2)'")
      print(result.stdout)  # "4\n"
  ```

  ```ts TypeScript theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
  import { SandboxClient } from "langsmith/sandbox";

  const client = new SandboxClient();
  const sandbox = await client.createSandbox();
  const result = await sandbox.run("node -e 'console.log(2 + 2)'");
  console.log(result.stdout); // "4\n"
  await sandbox.delete();
  ```

  Prefer the command line? The [Sandbox CLI](/langsmith/sandbox-cli) lets you create sandboxes, run commands, and open interactive shells without writing any code.

### 4. Use sandboxes with your agents

To wire sandboxes into agent code, see the Open Source docs:

* **Deep Agents** — [Sandboxes as agent backends](/oss/python/deepagents/sandboxes): configure a sandbox as the execution backend so your agent gets `execute` and filesystem tools automatically.
* **LangChain / LangGraph integrations** — [Sandbox integrations](/oss/python/integrations/sandboxes): connect to third-party sandbox providers (Daytona, Modal, etc.) or use LangSmith sandboxes as a first-party option.

## Resources

<CardGroup cols={2}>
  <Card title="Snapshots" icon="camera" href="/langsmith/sandbox-snapshots">
    Build filesystem images from Docker images or capture a running sandbox, then boot sandboxes from them.
  

  <Card title="Service URLs" icon="globe" href="/langsmith/sandbox-service-urls">
    Access HTTP services running inside sandboxes via authenticated URLs.
  

  <Card title="Auth proxy" icon="shield-lock" href="/langsmith/sandbox-auth-proxy">
    Inject credentials into outbound API requests without hardcoding secrets.
  

  <Card title="Permissions" icon="user-lock" href="/langsmith/sandbox-permissions">
    Control which workspace members can interact with a sandbox after it is created.
  

  <Card title="CLI" icon="terminal-2" href="/langsmith/sandbox-cli">
    Build snapshots, manage sandboxes, open consoles, and tunnel TCP ports from the command line.
  

  <Card title="SDK usage" icon="code" href="/langsmith/sandbox-sdk">
    Create and manage sandboxes programmatically with the Python or TypeScript SDK.
  

***

<div className="source-links">
  <Callout icon="terminal-2">
    [Connect these docs](/use-these-docs) to Claude, VSCode, and more via MCP for real-time answers.
  

  <Callout icon="edit">
    [Edit this page on GitHub](https://github.com/langchain-ai/docs/edit/main/src/langsmith/sandboxes.mdx) or [file an issue](https://github.com/langchain-ai/docs/issues/new/choose).
  
</div>

