# Hono — Core

## App Setup and Routing

```typescript
import { Hono } from "hono";

const app = new Hono();

// Basic routes
app.get("/", (c) => c.text("Home"));
app.post("/users", async (c) => c.json(await c.req.json(), 201));
app.put("/users/:id", (c) => c.json({ id: c.req.param("id") }));
app.delete("/users/:id", (c) => c.json({ deleted: c.req.param("id") }));
app.all("/any", (c) => c.text("Any method"));

// Route groups
const api = new Hono();
api.get("/users", (c) => c.json([]));
api.get("/users/:id", (c) => c.json({ id: c.req.param("id") }));

app.route("/api", api);

export default app;
```

### Routing Patterns

```typescript
app.get("/users/:id", handler);          // Named params
app.get("/posts/*", handler);            // Wildcard
app.get("/files{/:path}*", handler);     // Optional params
app.on("GET", ["/a", "/b"], handler);    // Multiple paths
app.on(["GET", "POST"], "/data", handler); // Multiple methods
```

## Context Object

### Request

```typescript
app.get("/search", (c) => {
  c.req.param("id");              // Route param
  c.req.query("q");              // Query param: ?q=hello
  c.req.queries("tag");          // Array of query values
  c.req.header("Authorization"); // Request header
  c.req.json();                  // Parse JSON body (Promise)
  c.req.text();                  // Parse text body (Promise)
  c.req.formData();              // Parse form data (Promise)
  c.req.parseBody();             // Parse body auto (Promise)
  c.req.url;                     // Full URL
  c.req.method;                  // HTTP method
  c.req.path;                    // URL path
});
```

### Response

```typescript
app.get("/responses", (c) => {
  return c.json({ key: "value" });          // JSON
  return c.json({ error: "bad" }, 400);     // JSON with status
  return c.text("Hello");                    // Plain text
  return c.html("<h1>Hello</h1>");           // HTML
  return c.redirect("/login");               // Redirect (302)
  return c.redirect("/login", 301);          // Redirect (301)
  return c.body(null, 204);                  // No content
  return c.notFound();                       // 404

  // Headers
  c.header("X-Custom", "value");
  return c.json({ ok: true });
});
```

## Middleware

### Built-in Middleware

```typescript
import { cors } from "hono/cors";
import { logger } from "hono/logger";
import { bearerAuth } from "hono/bearer-auth";
import { secureHeaders } from "hono/secure-headers";
import { compress } from "hono/compress";
import { prettyJSON } from "hono/pretty-json";
import { cache } from "hono/cache";
import { trimTrailingSlash } from "hono/trailing-slash";

app.use("*", logger());
app.use("/api/*", cors({ origin: "http://localhost:3000" }));
app.use("/api/*", bearerAuth({ token: "my-secret" }));
app.use("*", secureHeaders());
app.use("*", compress());
app.use("/api/*", prettyJSON());

// Cache (Cloudflare Workers)
app.get("/cached", cache({ cacheName: "my-cache", cacheControl: "max-age=3600" }), handler);
```

### Custom Middleware

```typescript
// Timing middleware
app.use("*", async (c, next) => {
  const start = Date.now();
  await next();
  c.header("X-Response-Time", `${Date.now() - start}ms`);
});

// Auth middleware
const auth = async (c: Context, next: Next) => {
  const token = c.req.header("Authorization");
  if (!token) return c.json({ error: "Unauthorized" }, 401);
  c.set("user", decodeToken(token));
  await next();
};

app.use("/protected/*", auth);
app.get("/protected/data", (c) => c.json({ user: c.get("user") }));
```

### Middleware with Variables

```typescript
import { setCookie, getCookie, deleteCookie } from "hono/cookie";

app.post("/login", (c) => {
  setCookie(c, "session", "abc123", { httpOnly: true, path: "/" });
  return c.json({ ok: true });
});

app.get("/me", (c) => {
  const session = getCookie(c, "session");
  return c.json({ session });
});
```

## JSX Support

```tsx
// Configure tsconfig.json: "jsx": "react-jsx", "jsxImportSource": "hono/jsx"

const Layout = ({ children }: { children: any }) => (
  <html>
    <head><title>My App</title></head>
    <body>{children}</body>
  </html>
);

const UserCard = ({ user }: { user: { name: string } }) => (
  <div class="card">
    <h2>{user.name}</h2>
  </div>
);

app.get("/users", (c) => {
  return c.html(
    <Layout>
      <UserCard user={{ name: "Alice" }} />
    </Layout>
  );
});
```

### Streaming

```typescript
import { stream, streamSSE } from "hono/streaming";

app.get("/stream", (c) => stream(c, async (s) => {
  for (let i = 0; i < 10; i++) {
    await s.write(`chunk ${i}\n`);
    await s.sleep(100);
  }
}));

app.get("/sse", (c) => streamSSE(c, async (s) => {
  await s.write({ event: "message", data: "Hello" });
  await s.write({ event: "message", data: "World" });
}));
```

## RPC

### Server

```typescript
import { Hono } from "hono";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";

const app = new Hono()
  .get("/api/users/:id", (c) => c.json({ id: c.req.param("id"), name: "Alice" }))
  .post("/api/users", zValidator("json", z.object({ name: z.string() })), (c) => {
    const body = c.req.valid("json");
    return c.json({ id: "1", name: body.name }, 201);
  });

export type AppType = typeof app;
```

### Client

```typescript
import { hc } from "hono/client";
import type { AppType } from "./server";

const client = hc<AppType>("http://localhost:8787");

// Type-safe API calls
const res = await client.api.users[":id"].$get({ param: { id: "42" } });
const user = await res.json(); // { id: string; name: string }

const createRes = await client.api.users.$post({ json: { name: "Bob" } });
const newUser = await createRes.json(); // { id: string; name: string }
```

## Adapters

### Cloudflare Workers

```typescript
// wrangler.toml: name = "my-app"
import { Hono } from "hono";
const app = new Hono();
app.get("/", (c) => c.text("Hello from Cloudflare!"));
export default app;
```

### Deno

```typescript
import { Hono } from "https://deno.land/x/hono/mod.ts";
import { serve } from "https://deno.land/std/http/server.ts";
const app = new Hono();
serve(app.fetch, { port: 8000 });
```

### Bun

```typescript
import { Hono } from "hono";
const app = new Hono();
export default { port: 3000, fetch: app.fetch };
```

### Node.js

```typescript
import { Hono } from "hono";
import { serve } from "@hono/node-server";
const app = new Hono();
serve({ fetch: app.fetch, port: 3000 });
```

### AWS Lambda

```typescript
import { Hono } from "hono";
import { handle } from "hono/aws-lambda";
const app = new Hono();
app.get("/", (c) => c.text("Hello Lambda!"));
export const handler = handle(app);
```

## Testing

```typescript
import { Hono } from "hono";
import { describe, it, expect } from "vitest";

const app = new Hono()
  .get("/hello", (c) => c.json({ message: "Hello" }))
  .post("/users", async (c) => c.json(await c.req.json(), 201));

describe("App", () => {
  it("GET /hello returns 200", async () => {
    const res = await app.request("/hello");
    expect(res.status).toBe(200);
    expect(await res.json()).toEqual({ message: "Hello" });
  });

  it("POST /users returns 201", async () => {
    const res = await app.request("/users", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name: "Alice" }),
    });
    expect(res.status).toBe(201);
  });
});
```

## See Also

- [Hono Documentation](https://hono.dev/)
- [Hono API Reference](https://hono.dev/api/hono)
- [Hono GitHub](https://github.com/honojs/hono)
- [Hono Examples](https://github.com/honojs/examples)
