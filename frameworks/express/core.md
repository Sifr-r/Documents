# Express — Core

## App Setup

```javascript
const express = require("express");
const app = express();

// Built-in middleware
app.use(express.json());                        // Parse JSON bodies
app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies
app.use(express.static("public"));               // Serve static files

app.listen(3000, () => console.log("Listening on :3000"));
```

### Application Factory

```javascript
function createApp() {
  const app = express();
  app.use(express.json());
  app.use("/api", apiRouter);
  app.use(errorHandler);
  return app;
}

module.exports = createApp;
```

## Routing

### app.METHOD

```javascript
app.get("/users", (req, res) => res.json(users));
app.post("/users", (req, res) => res.status(201).json(req.body));
app.put("/users/:id", (req, res) => res.json({ updated: req.params.id }));
app.patch("/users/:id", (req, res) => res.json({ patched: req.params.id }));
app.delete("/users/:id", (req, res) => res.status(204).send());
app.all("/any-method", (req, res) => res.send("Any method"));
```

### Express Router

```javascript
const router = express.Router();

router.get("/", (req, res) => res.json({ items: [] }));
router.get("/:id", (req, res) => res.json({ id: req.params.id }));
router.post("/", (req, res) => res.status(201).json(req.body));

// Route-level middleware
router.get("/admin", authMiddleware, (req, res) => res.json({ admin: true }));

// Mount router
app.use("/api/items", router);
```

### Route Parameters

```javascript
app.get("/users/:userId/posts/:postId", (req, res) => {
  const { userId, postId } = req.params;
  res.json({ userId, postId });
});

// Regex in routes
app.get("/files/*", (req, res) => res.send(req.params[0]));
```

## Request Object

```javascript
app.post("/api/data", (req, res) => {
  req.params.id;          // Route params
  req.query.page;         // Query string: ?page=2
  req.body;               // Parsed body (needs express.json())
  req.headers;            // Request headers
  req.get("Content-Type");// Specific header
  req.method;             // HTTP method
  req.path;               // URL path
  req.hostname;           // Hostname
  req.ip;                 // Client IP
  req.cookies;            // Cookies (needs cookie-parser)
});
```

## Response Object

```javascript
app.get("/api/items", (req, res) => {
  res.json({ items: [] });                    // JSON response
  res.send("Hello");                          // String/buffer
  res.status(201).json({ created: true });    // Status + JSON
  res.redirect("/other");                     // Redirect
  res.sendFile(path.join(__dirname, "index.html")); // Send file
  res.download("./report.pdf");               // File download
  res.set("X-Custom", "value");               // Set header
  res.cookie("token", "abc", { httpOnly: true }); // Set cookie
  res.clearCookie("token");                   // Clear cookie
});
```

## Middleware

### Built-in Middleware

```javascript
express.json({ limit: "10mb" });              // Parse JSON
express.urlencoded({ extended: true });        // Parse form data
express.static("public", { maxAge: "1d" });   // Static files
express.raw({ type: "application/octet-stream" }); // Raw body
```

### Third-Party Middleware

```javascript
const cors = require("cors");
const helmet = require("helmet");
const morgan = require("morgan");
const rateLimit = require("express-rate-limit");
const compression = require("compression");

app.use(cors({ origin: "http://localhost:3000", credentials: true }));
app.use(helmet());                            // Security headers
app.use(morgan("dev"));                       // HTTP logger
app.use(compression());                       // Gzip compression
```

### Custom Middleware

```javascript
function authMiddleware(req, res, next) {
  const token = req.get("Authorization");
  if (!token) return res.status(401).json({ error: "Unauthorized" });
  try {
    req.user = jwt.verify(token, SECRET);
    next();
  } catch {
    res.status(403).json({ error: "Invalid token" });
  }
}

app.get("/protected", authMiddleware, (req, res) => {
  res.json({ user: req.user });
});
```

### Error-Handling Middleware

```javascript
// Must have 4 parameters
app.use((err, req, res, next) => {
  console.error(err.stack);
  const status = err.status || 500;
  res.status(status).json({
    error: err.message || "Internal Server Error",
  });
});
```

## Static Files

```javascript
app.use(express.static("public"));
app.use("/assets", express.static("public/assets"));

// Options
app.use(express.static("public", {
  maxAge: "7d",
  etag: true,
  index: "index.html",
  dotfiles: "ignore",
}));
```

## Template Engines

```javascript
app.set("view engine", "pug");
app.set("views", "./views");

app.get("/", (req, res) => {
  res.render("index", { title: "Home", items: [1, 2, 3] });
});
```

## CORS

```javascript
const cors = require("cors");

// Allow all origins
app.use(cors());

// Configure
app.use(cors({
  origin: ["http://localhost:3000", "https://myapp.com"],
  methods: ["GET", "POST", "PUT", "DELETE"],
  allowedHeaders: ["Content-Type", "Authorization"],
  credentials: true,
  maxAge: 86400,
}));

// Per-route
app.get("/api/data", cors({ origin: "http://localhost:3000" }), handler);
```

## Helmet

```javascript
const helmet = require("helmet");

app.use(helmet()); // Sets security headers

// Individual directives
app.use(helmet.contentSecurityPolicy({
  directives: {
    defaultSrc: ["'self'"],
    scriptSrc: ["'self'", "'unsafe-inline'"],
  },
}));
app.use(helmet.crossOriginResourcePolicy({ policy: "cross-origin" }));
```

## Rate Limiting

```javascript
const rateLimit = require("express-rate-limit");

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100,                  // 100 requests per window
  message: { error: "Too many requests" },
  standardHeaders: true,
});

app.use(limiter);

// Per-route
const authLimiter = rateLimit({ windowMs: 60000, max: 5 });
app.post("/login", authLimiter, loginHandler);
```

## Testing

```javascript
const request = require("supertest");
const app = require("./app");

describe("GET /api/users", () => {
  it("returns 200 with users", async () => {
    const res = await request(app).get("/api/users");
    expect(res.status).toBe(200);
    expect(res.body).toHaveLength(3);
  });
});

describe("POST /api/users", () => {
  it("creates a user", async () => {
    const res = await request(app)
      .post("/api/users")
      .send({ name: "Alice", email: "alice@test.com" })
      .set("Authorization", "Bearer token123");
    expect(res.status).toBe(201);
    expect(res.body.name).toBe("Alice");
  });
});
```

## See Also

- [Express Documentation](https://expressjs.com/)
- [Express API Reference](https://expressjs.com/en/4x/api.html)
- [Express Middleware](https://expressjs.com/en/resources/middleware.html)
- [Express GitHub](https://github.com/expressjs/express)
