# managed-deep-agents-invoke

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# Run a Managed Deep Agent

> Create threads and stream runs for a Managed Deep Agent.

Running a Managed Deep Agent covers creating threads, starting runs, and streaming output. Deploy the agent first with the [CLI, SDK, or REST API](/langsmith/managed-deep-agents-deploy), then invoke it with the SDKs or REST API.

  Managed Deep Agents is in **private preview**, available on [LangSmith Cloud](/langsmith/cloud) in the US region only. [Join the waitlist](https://www.langchain.com/langsmith-managed-deep-agents-waitlist) to request access.

## CLI: find the agent ID

There is no CLI command for running Managed Deep Agents yet. Use the CLI to find the agent ID, then use the SDKs or REST API to create threads and stream runs.

List agents:

```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
deepagents agents list
```

Inspect one agent:

```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
deepagents agents get <agent_id>
```

## SDK or API: create threads and stream runs

Install the SDK for your runtime:

  ```bash Python theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
  pip install managed-deepagents
  ```

  ```bash TypeScript theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
  npm install @langchain/managed-deepagents
  ```

Set request defaults:

```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
export LANGSMITH_API_KEY="<LANGSMITH_API_KEY>"
export LANGSMITH_API_URL="https://api.smith.langchain.com"
export DEEPAGENTS_BASE_URL="$LANGSMITH_API_URL/v1/deepagents"
export AGENT_ID="<agent_id>"
```

The SDKs read `LANGSMITH_API_KEY` by default. REST requests require the `X-Api-Key` header:

```txt theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
X-Api-Key: <LANGSMITH_API_KEY>
```

The examples below reuse these variables:

  <Tab title="Python SDK">
    ```python theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
    import os

    from managed_deepagents import Client

    agent_id = os.environ["AGENT_ID"]
    client = Client()
    ```
  

  <Tab title="TypeScript SDK">
    ```ts theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
    import { Client } from "@langchain/managed-deepagents";

    const agentId = process.env.AGENT_ID!;
    const client = new Client({
      apiKey: process.env.LANGSMITH_API_KEY,
    });
    ```
  

  <Tab title="cURL">
    ```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
    export AGENT_ID="<agent_id>"
    ```
  

### Create a thread

Create a thread before running the agent. Threads preserve conversation and execution state for long-running work:

  <Tab title="Python SDK">
    ```python theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
    thread = client.threads.create(
        agent_id=agent_id,
        options={
            "test_run": False,
            "skip_memory_write_protection": False,
        },
    )
    thread_id = thread["id"]
    print(f"Thread ID: {thread_id}")
    ```
  

  <Tab title="TypeScript SDK">
    ```ts theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
    const thread = await client.threads.create({
      agent_id: agentId,
      options: {
        test_run: false,
        skip_memory_write_protection: false,
      },
    });
    const threadId = thread.id;
    console.log(`Thread ID: ${threadId}`);
    ```
  

  <Tab title="cURL">
    ```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
    curl --request POST \
      --url "$DEEPAGENTS_BASE_URL/threads" \
      --header "X-Api-Key: $LANGSMITH_API_KEY" \
      --header 'Content-Type: application/json' \
      --data '{
        "agent_id": "'"$AGENT_ID"'",
        "options": {
          "test_run": false,
          "skip_memory_write_protection": false
        }
      }'
    ```
  

For cURL, set the returned thread ID before streaming:

```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
export THREAD_ID="<thread_id>"
```

### Stream a run from a thread

Start work on the thread and stream the result:

## SDK or API: create threads and stream runs (part 2)

<Tab title="Python SDK">
    ```python theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
    for event in client.threads.stream(
        thread_id,
        agent_id=agent_id,
        messages=[
            {
                "role": "user",
                "content": "Research recent approaches to agent memory and summarize the main tradeoffs.",
            }
        ],
        stream_mode=["values", "updates", "messages-tuple"],
        stream_subgraphs=True,
        user_timezone="America/Los_Angeles",
    ):
        print(event.event, event.data)
    ```
  

  <Tab title="TypeScript SDK">
    ```ts theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
    const langGraphClient = client.getLangGraphClient({ agentId });
    const stream = langGraphClient.runs.stream(threadId, agentId, {
      input: {
        messages: [
          {
            role: "user",
            content:
              "Research recent approaches to agent memory and summarize the main tradeoffs.",
          },
        ],
      },
      streamMode: ["values", "updates", "messages-tuple"],
      streamSubgraphs: true,
    });

    for await (const event of stream) {
      console.log(event.event, event.data);
    }
    ```
  

  <Tab title="cURL">
    ```bash theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
    curl --request POST \
      --url "$DEEPAGENTS_BASE_URL/threads/$THREAD_ID/runs/stream" \
      --header "X-Api-Key: $LANGSMITH_API_KEY" \
      --header 'Accept: text/event-stream' \
      --header 'Content-Type: application/json' \
      --data '{
        "agent_id": "'"$AGENT_ID"'",
        "input": {
          "messages": [
            {
              "role": "user",
              "content": "Research recent approaches to agent memory and summarize the main tradeoffs."
            }
          ]
        },
        "stream_mode": ["values", "updates", "messages-tuple"],
        "stream_subgraphs": true,
        "user_timezone": "America/Los_Angeles"
      }'
    ```
  

The Python SDK and TypeScript SDK examples stream route-level events. The React `useStream` example below exposes LangGraph projections such as `stream.messages`, `stream.values`, and output state for chat UIs.

### Stream with React `useStream`

For React applications, use the TypeScript SDK's LangGraph client adapter with `@langchain/react`:

```tsx theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
import { Client } from "@langchain/managed-deepagents";
import { useStream } from "@langchain/react";

const agentId = "<agent_id>";

const managedDeepAgents = new Client({
  // In browser apps, prefer passing a custom fetch that calls your backend.
  apiKey: process.env.LANGSMITH_API_KEY,
});

const client = managedDeepAgents.getLangGraphClient({ agentId });

export function ManagedDeepAgentStream() {
  const stream = useStream({
    client,
    assistantId: agentId,
    fetchStateHistory: false,
  });

## SDK or API: create threads and stream runs (part 3)

return (
    <section>
      <button
        type="button"
        disabled={stream.isLoading}
        onClick={() => {
          void stream.submit({
            messages: [
              { role: "user", content: "Write a short status update." },
            ],
          });
        }}
      >
        Run agent
      </button>

      {stream.messages.map((message, index) => (
        <p key={message.id ?? index}>{String(message.content)}</p>
      ))}
    </section>
  );
}
```

For more SDK configuration details, see the [Managed Deep Agents SDK reference](/langsmith/managed-deep-agents-sdk).

Use stream modes based on the experience you want to build:

| Stream mode      | Use for                                       |
| ---------------- | --------------------------------------------- |
| `values`         | Full state snapshots after steps.             |
| `updates`        | Incremental state updates as the agent works. |
| `messages-tuple` | Token-level message output for chat UIs.      |

`messages-tuple` mode emits a `messages` event. The payload is a `[chunk, metadata]` tuple.

For route-level details, see the [Managed Deep Agents API reference](/langsmith/managed-deep-agents-api-overview).

***

<div className="source-links">
  <Callout icon="terminal-2">
    [Connect these docs](/use-these-docs) to Claude, VSCode, and more via MCP for real-time answers.
  

  <Callout icon="edit">
    [Edit this page on GitHub](https://github.com/langchain-ai/docs/edit/main/src/langsmith/managed-deep-agents-invoke.mdx) or [file an issue](https://github.com/langchain-ai/docs/issues/new/choose).
  
</div>

