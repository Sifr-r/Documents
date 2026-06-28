# Graph — API & SDK Reference

`@neuledge/graph` allows AI agents to perform semantic lookups against pre-cached live data.

## Installation

```bash
npm install @neuledge/graph zod
```

## API Reference

### `NeuledgeGraph`
The main class representing the semantic graph.

```typescript
import { NeuledgeGraph } from "@neuledge/graph";

const graph = new NeuledgeGraph(options?: NeuledgeGraphOptions);
```

#### Options:
- `sources` (optional): Connect custom databases or APIs to the graph *(coming soon)*.
- `cache` (optional): Configuration for caching responses.
  - `ttl` (number): Time-to-live in seconds for cached data (default: 300).

#### Methods:
- `lookup(query: string): Promise<Record<string, any>>`
  Performs a semantic query and returns the structured facts as a JSON object.
- `parameters`: A Zod schema defining the parameters accepted by `lookup` for tool integration.

---

## SDK Integration Patterns

### 1. Vercel AI SDK
Integrate the lookup tool into your agent loop using the `tool` helper:

```typescript
import { tool } from "ai";
import { NeuledgeGraph } from "@neuledge/graph";

const graph = new NeuledgeGraph();

const lookupTool = tool({
  description: "Gives access to real-time facts including weather, stocks, and exchange rates.",
  parameters: graph.parameters, // Type-safe Zod schema
  execute: async ({ query }) => {
    return await graph.lookup(query);
  },
});
```

### 2. OpenAI Agents SDK
Register the lookup function as an agent tool:

```typescript
import { OpenAI } from "openai";
import { NeuledgeGraph } from "@neuledge/graph";

const openai = new OpenAI();
const graph = new NeuledgeGraph();

const runner = openai.beta.chat.completions.runTools({
  model: "gpt-4o",
  messages: [{ role: "user", content: "Is Apple stock up today?" }],
  tools: [
    {
      type: "function",
      function: {
        name: "lookup",
        description: "Lookup real-time facts including weather, stocks, and exchange rates.",
        parameters: {
          type: "object",
          properties: {
            query: { type: "string" }
          },
          required: ["query"]
        }
      }
    }
  ],
});

runner.on("functionCall", async (call) => {
  if (call.name === "lookup") {
    const { query } = JSON.parse(call.arguments);
    return JSON.stringify(await graph.lookup(query));
  }
});
```

### 3. LangChain
Integrate the lookup tool as a custom tool:

```typescript
import { Tool } from "@langchain/core/tools";
import { NeuledgeGraph } from "@neuledge/graph";

const graph = new NeuledgeGraph();

class GraphLookupTool extends Tool {
  name = "graph_lookup";
  description = "Lookup real-time facts like weather, stocks, and exchange rates using a semantic query.";

  async _call(query: string): Promise<string> {
    const result = await graph.lookup(query);
    return JSON.stringify(result);
  }
}
```

---

## Supported Query Patterns & Use Cases

The semantic router parses natural language queries and returns optimized JSON structures:

| Domain | Natural Query Example | Resolved Key Example | Output Data |
|---|---|---|---|
| **Weather** | `"What is the weather in Tokyo?"` | `cities.tokyo.weather` | `{"temp": "68F", "condition": "Sunny", ...}` |
| **Stocks** | `"AAPL stock price"` | `stocks.aapl` | `{"price": 175.20, "change": +1.20, ...}` |
| **FX** | `"Convert $250 to EUR"` | `exchange.usd.eur` | `{"amount": 250, "from": "USD", "to": "EUR", "result": 215}` |
| **Time** | `"What time is it in London?"` | `time.london` | `{"time": "12:42 PM", "timezone": "GMT", ...}` |

## See Also
- [Graph GitHub Repository](https://github.com/neuledge/graph)
- [Official Website](https://neuledge.com/graph)
