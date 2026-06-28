# managed-deep-agents-api-overview

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# Managed Deep Agents API reference

> Common REST commands and generated endpoint references for Managed Deep Agents.

The Managed Deep Agents API is a private preview API for creating, updating, connecting, and invoking [Managed Deep Agents](/langsmith/managed-deep-agents-overview). Use the [Managed Deep Agents SDKs](/langsmith/managed-deep-agents-sdk) for Python, TypeScript, and React applications. Use the REST API when you need direct control over request payloads. For the recommended end-to-end workflow, see the [quickstart](/langsmith/managed-deep-agents-quickstart).

  Managed Deep Agents is in **private preview**, available on [LangSmith Cloud](/langsmith/cloud) in the US region only. [Join the waitlist](https://www.langchain.com/langsmith-managed-deep-agents-waitlist) to request access.

## Set request defaults

The private preview API uses `/v1/deepagents`:

```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
export LANGSMITH_API_KEY="<LANGSMITH_API_KEY>"
export LANGSMITH_API_URL="https://api.smith.langchain.com"
export DEEPAGENTS_BASE_URL="$LANGSMITH_API_URL/v1/deepagents"
```

Requests require the `X-Api-Key` header:

```txt theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
X-Api-Key: <LANGSMITH_API_KEY>
```

For example, list agents with the base URL and header set above:

```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
curl "$DEEPAGENTS_BASE_URL/agents" \
  -H "X-Api-Key: $LANGSMITH_API_KEY"
```

A missing `X-Api-Key` header returns `401` with `{"error": "Unauthorized"}`. A key that is invalid or lacks workspace access returns `403` with `{"error": "Forbidden"}`. These auth responses use a flat `{"error": "..."}` body, unlike the structured error body returned by other `4xx` responses.

## Understand resource groups

| Resource group | Purpose                                                                                      |
| -------------- | -------------------------------------------------------------------------------------------- |
| Agents         | Create and manage Managed Deep Agent resources, including runtime and backend configuration. |
| Threads        | Create and manage durable thread state for Managed Deep Agents.                              |
| Runs           | Start and stream Managed Deep Agent runs on threads.                                         |
| MCP servers    | Register MCP servers and store credentials referenced by agent tools.                        |
| MCP tools      | List tools exposed by a registered MCP server so clients can build `tools.json` entries.     |
| Auth sessions  | Start and poll user OAuth sessions for OAuth MCP servers.                                    |

Managed Deep Agents are not LangSmith Deployments. Creating a Managed Deep Agent creates a Managed Deep Agent resource, a separate LangSmith tracing project, and a Context Hub agent repo for the managed file tree.

## Configure sandboxes

Create-agent and update-agent payloads can include a `backend` object. Use `state` when the agent does not need sandbox-specific backend behavior:

```json theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
{
  "backend": {
    "type": "state"
  }
}
```

Use `sandbox` when the agent needs a [LangSmith sandbox](/langsmith/sandboxes) for code execution, filesystem work, or long-running tasks. Sandbox backend settings live under `backend.sandbox_config` and are valid only when `backend.type` is `sandbox`:

```json theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
{
  "backend": {
    "type": "sandbox",
    "sandbox_config": {
      "scope": "thread",
      "policy_ids": ["policy-id"],
      "idle_ttl_seconds": 900,
      "delete_after_stop_seconds": 300
    }
  }
}
```

The `sandbox` object accepts:

| Field                       | Description                                                                                             |
| --------------------------- | ------------------------------------------------------------------------------------------------------- |
| `scope`                     | Sandbox scope. Use `thread` for one sandbox per thread, or `agent` for one sandbox shared by the agent. |
| `policy_ids`                | Sandbox policy IDs to apply.                                                                            |
| `idle_ttl_seconds`          | Idle timeout before the sandbox stops, in seconds.                                                      |
| `delete_after_stop_seconds` | Delay before the sandbox is deleted after it stops, in seconds.                                         |

For backend guidance, see [Deploy an agent](/langsmith/managed-deep-agents-deploy#choose-a-backend). For standalone sandbox concepts, see the [LangSmith sandboxes overview](/langsmith/sandboxes).

## Paginate the agents list

[`GET /v1/deepagents/agents`](/langsmith/managed-deep-agents-api/agents/list-agents) is cursor-paginated. Pass `page_size` (defaults to `20`, maximum `100`) and the opaque `cursor` returned by a previous request. The response wraps results in an `items` array alongside a `next_cursor` field that is `null` on the last page:

```json theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
{
  "items": [],
  "next_cursor": null
}
```

The endpoint also accepts `name` to filter by name substring, `sort_by` (`created_at`, `updated_at`, or `name`, defaults to `updated_at`), and `sort_order` (`asc` or `desc`, defaults to `desc`).

## Understand API stability

Routes are versioned at `/v1/`, but the surface is in private preview and may change in backwards-incompatible ways before general availability. See [API stability](/langsmith/managed-deep-agents-overview#api-stability) for breaking-change communication.

The API does not mirror every LangSmith Deployment endpoint in private preview. Endpoint groups such as integrations, triggers, skills, sandboxes, auth providers, and auth tokens are not mirrored yet.

***

<div className="source-links">
  <Callout icon="terminal-2">
    [Connect these docs](/use-these-docs) to Claude, VSCode, and more via MCP for real-time answers.
  

  <Callout icon="edit">
    [Edit this page on GitHub](https://github.com/langchain-ai/docs/edit/main/src/langsmith/managed-deep-agents-api-overview.mdx) or [file an issue](https://github.com/langchain-ai/docs/issues/new/choose).
  
</div>

