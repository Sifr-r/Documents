# Hono

Hono is an ultrafast, lightweight web framework for edge runtimes including Cloudflare Workers, Deno, Bun, Node.js, and AWS Lambda. It offers Express-like API design with full TypeScript support and built-in RPC capabilities.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | App setup/routing, context object, middleware, JSX, RPC, benchmarks, adapters, and testing |

## Quick Reference

### Minimal App

```typescript
import { Hono } from "hono";

const app = new Hono();

app.get("/", (c) => c.json({ message: "Hello, Hono!" }));

export default app;
```

### Routing

```typescript
app.get("/users/:id", (c) => c.json({ id: c.req.param("id") }));
app.post("/users", (c) => c.json(c.req.json(), 201));
app.all("/any", (c) => c.text("Any method"));
```

### Middleware

```typescript
import { cors } from "hono/cors";
import { logger } from "hono/logger";

app.use("*", logger());
app.use("/api/*", cors());

// Custom
app.use("*", async (c, next) => {
  console.log(`${c.req.method} ${c.req.url}`);
  await next();
});
```

### RPC Client

```typescript
// server
const app = new Hono().get("/api/users/:id", (c) => c.json({ id: c.req.param("id") }));
export type AppType = typeof app;

// client — type-safe fetching
import { hc } from "hono/client";
const client = hc<AppType>("https://api.example.com");
const res = await client.api.users[":id"].$get({ param: { id: "1" } });
const data = await res.json(); // typed!
```

## See Also

- [Hono Documentation](https://hono.dev/)
- [Hono GitHub](https://github.com/honojs/hono)
- [Hono Examples](https://github.com/honojs/examples)
