# Express

Express 4/5 is a minimal, flexible web framework for Node.js. It provides a robust set of features for building web applications and APIs with a rich ecosystem of middleware.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | App setup, routing, request/response, middleware, static files, template engines, error handling, CORS, Helmet, rate limiting, and testing |

## Quick Reference

### Minimal App

```javascript
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.json({ message: "Hello, Express!" });
});

app.listen(3000, () => console.log("Server running on port 3000"));
```

### Routing

```javascript
app.get("/users/:id", (req, res) => {
  res.json({ userId: req.params.id });
});

app.post("/users", express.json(), (req, res) => {
  res.status(201).json(req.body);
});
```

### Router

```javascript
const router = express.Router();

router.get("/", (req, res) => res.json({ items: [] }));
router.get("/:id", (req, res) => res.json({ id: req.params.id }));
router.post("/", (req, res) => res.status(201).json(req.body));

app.use("/api/items", router);
```

### Middleware

```javascript
// Built-in
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static("public"));

// Custom
app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  next();
});
```

### Error Handling

```javascript
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(err.status || 500).json({ error: err.message });
});
```

## See Also

- [Express Documentation](https://expressjs.com/)
- [Express GitHub](https://github.com/expressjs/express)
- [Express Middleware](https://expressjs.com/en/resources/middleware.html)
