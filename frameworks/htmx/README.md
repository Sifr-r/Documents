# htmx

htmx is a lightweight library that gives HTML the power to make AJAX requests, use CSS transitions, and handle WebSockets and Server-Sent Events — all through HTML attributes. It promotes a "HTML over the wire" approach where the server returns HTML fragments.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Attributes, swap strategies, events, boosting, WebSockets/SSE, extensions, and common patterns |

## Quick Reference

### Basic AJAX

```html
<!-- GET request, replace element innerHTML -->
<button hx-get="/api/count" hx-target="this">
  Load Count
</button>

<!-- POST form -->
<form hx-post="/api/subscribe" hx-target="#result">
  <input name="email" type="email" required />
  <button type="submit">Subscribe</button>
</form>
<div id="result"></div>
```

### Swap Strategies

```html
<!-- Replace innerHTML (default) -->
<div hx-get="/content" hx-swap="innerHTML">Replace content</div>

<!-- Replace outerHTML (replace the element itself) -->
<div hx-get="/updated-card" hx-swap="outerHTML">Update card</div>

<!-- Insert before/after the target -->
<button hx-get="/more-items" hx-target="#list" hx-swap="beforeend">
  Load More
</button>

<!-- Delete element -->
<button hx-delete="/item/123" hx-swap="delete">Remove</button>

<!-- Transition (uses View Transitions API) -->
<div hx-get="/page" hx-swap="innerHTML transition:true">Smooth swap</div>
```

### Targeting

```html
<!-- Target another element by CSS selector -->
<button hx-get="/notification" hx-target="#toast">Show</button>

<!-- Target relative to the element -->
<button hx-get="/data" hx-target="closest .card">Update parent card</button>
<button hx-get="/data" hx-target="next .output">Next sibling output</button>
<button hx-get="/data" hx-target="previous .log">Previous log</button>

<!-- Target the body -->
<button hx-get="/page" hx-target="body">Full page swap</button>
```

### Triggers

```html
<!-- Click (default for buttons/links) -->
<button hx-get="/data">Click me</button>

<!-- Input change (with delay) -->
<input hx-get="/search" hx-trigger="keyup changed delay:300ms" />

<!-- Intersection (lazy load) -->
<div hx-get="/heavy-content" hx-trigger="intersect once">
  Loading...
</div>

<!-- Timer -->
<div hx-get="/status" hx-trigger="every 5s">Live status</div>

<!-- Multiple triggers -->
<input hx-get="/validate" hx-trigger="keyup changed delay:500ms, blur" />
```

### Loading Indicators

```html
<button hx-post="/save" hx-indicator="#spinner">
  Save
</button>
<div id="spinner" class="htmx-indicator">Saving...</div>

<!-- Self-indicator -->
<button hx-get="/data" hx-indicator="this">
  Load <span class="htmx-indicator">Loading...</span>
</button>
```

### Boost (progressive enhancement)

```html
<!-- Turn all links and forms into AJAX -->
<body hx-boost="true">
  <a href="/page">AJAX navigation</a>
  <form action="/submit" method="post">AJAX form</form>
</body>
```

### Infinite Scroll

```html
<div hx-get="/api/items?page=2" hx-trigger="revealed" hx-swap="afterend">
  <!-- Items render here, next page link replaces this -->
</div>
```

### Search as You Type

```html
<input
  hx-get="/api/search"
  hx-trigger="keyup changed delay:300ms"
  hx-target="#results"
  hx-indicator="#search-spinner"
  name="q"
  placeholder="Search..."
/>
<div id="results"></div>
```

## See Also

- [htmx Documentation](https://htmx.org/docs)
- [htmx Examples](https://htmx.org/examples)
- [htmx GitHub](https://github.com/bigskysoftware/htmx)
