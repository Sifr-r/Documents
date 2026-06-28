# @neuledge/graph

`@neuledge/graph` is a semantic data layer designed to give AI agents structured, real-time access to live data (such as weather, stock prices, exchange rates, and calendars) in under 100ms. It solves AI hallucinations by grounding agents in verified facts through a single `lookup()` tool.

## Topics

| Topic | File | Description |
|---|---|---|
| Core | [core.md](core.md) | Library installation, graph configuration, agent integrations, and API reference |

## Quick Reference

### Installation

```bash
npm install @neuledge/graph zod
# or using pnpm
pnpm add @neuledge/graph zod
```

### Basic Setup

```typescript
import { NeuledgeGraph } from "@neuledge/graph";

// 1. Initialize the graph
const graph = new NeuledgeGraph();

// 2. Perform a lookup using natural language
const result = await graph.lookup("What is the current Bitcoin price?");
console.log(result);
```

### Agent Integration (Vercel AI SDK)

```typescript
import { generateText, tool } from "ai";
import { openai } from "@ai-sdk/openai";
import { NeuledgeGraph } from "@neuledge/graph";

const graph = new NeuledgeGraph();

const response = await generateText({
  model: openai("gpt-4o"),
  prompt: "How much is $100 in EUR?",
  tools: {
    lookup: tool({
      description: "Lookup real-time facts such as weather, stocks, exchange rates, etc.",
      parameters: graph.parameters,
      execute: async ({ query }) => graph.lookup(query),
    }),
  },
});
```
