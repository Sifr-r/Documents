# htmx — Core

## Core Attributes

### HTTP Methods

```html
<!-- GET -->
<button hx-get="/api/data">Load</button>

<!-- POST -->
<form hx-post="/api/create">...</form>

<!-- PUT -->
<button hx-put="/api/item/123">Update</button>

<!-- PATCH -->
<button hx-patch="/api/item/123/status">Toggle</button>

<!-- DELETE -->
<button hx-delete="/api/item/123">Remove</button>
```

### hx-target

Controls where the response HTML is placed. Accepts CSS selectors or relative keywords.

```html
<!-- CSS selector -->
<button hx-get="/data" hx-target="#output">Load into #output</button>

<!-- this -->
<button hx-get="/data" hx-target="this">Replace my content</button>

<!-- Relative targeting -->
<button hx-get="/data" hx-target="closest tr">Nearest parent <tr></button>
<button hx-get="/data" hx-target="next .card">Next sibling .card</button>
<button hx-get="/data" hx-target="previous .panel">Previous sibling .panel</button>
<button hx-get="/data" hx-target="find .detail">First descendant .detail</button>
```

### hx-swap

Controls how the response replaces content.

| Value | Behavior |
|-------|----------|
| `innerHTML` | Replace inner content (default) |
| `outerHTML` | Replace the entire element |
| `beforebegin` | Insert before the element |
| `afterbegin` | Insert at start of inner content |
| `beforeend` | Append to inner content |
| `afterend` | Insert after the element |
| `delete` | Remove the element |
| `none` | No swap (useful for side effects) |

```html
<!-- Append items to a list -->
<button hx-get="/more" hx-target="#list" hx-swap="beforeend">Load More</button>

<!-- Swap with modifiers -->
<div hx-get="/page" hx-swap="innerHTML swap:500ms settle:100ms">
  500ms swap transition, 100ms before settling
</div>

<!-- Scroll and focus after swap -->
<div hx-get="/section" hx-swap="innerHTML show:top">Scroll to top</div>
<div hx-get="/form" hx-swap="outerHTML focus-scroll:true">Focus after swap</div>

<!-- View Transitions API -->
<div hx-get="/page" hx-swap="innerHTML transition:true">Smooth transition</div>
```

### hx-trigger

Controls what event triggers the request.

```html
<!-- Default: click for buttons/links, change for inputs -->
<button hx-get="/data">Click to load</button>

<!-- Keyboard events with filters -->
<input hx-get="/search" hx-trigger="keyup changed delay:300ms" />
<!-- changed = only if value changed, delay = debounce -->

<!-- Intersection Observer -->
<div hx-get="/lazy-section" hx-trigger="intersect once threshold:0.5">
  Loads when 50% visible, once only
</div>

<!-- Polling -->
<div hx-get="/notifications" hx-trigger="every 3s">Live feed</div>

<!-- Multiple triggers -->
<input hx-get="/validate" hx-trigger="keyup changed delay:500ms, blur" />

<!-- Custom events -->
<div hx-get="/refresh" hx-trigger="customEvent from:document">
  Listens for document.dispatchEvent(new Event('customEvent'))
</div>

<!-- Conditional trigger -->
<button hx-post="/submit" hx-trigger="click[confirm('Are you sure?')]">
  Confirm before submit
</button>
```

### hx-indicator

Shows a loading indicator during the request.

```html
<!-- Element by ID -->
<button hx-post="/save" hx-indicator="#spinner">Save</button>
<span id="spinner" class="htmx-indicator">Saving...</span>

<!-- The element itself -->
<button hx-get="/data" hx-indicator="this">
  Load
  <span class="htmx-indicator">Loading...</span>
</button>

<!-- Multiple indicators -->
<button hx-get="/data" hx-indicator="#spinner, #overlay">Load</button>
```

CSS for indicators:

```css
.htmx-indicator { opacity: 0; transition: opacity 200ms; }
.htmx-request .htmx-indicator { opacity: 1; }
.htmx-request.htmx-indicator { opacity: 1; }
```

## Additional Attributes

```html
<!-- Include additional values in the request -->
<button hx-post="/action"
        hx-include="#extra-input"
        hx-vals='{"key": "value"}'>
  Submit
</button>

<!-- Set request headers -->
<div hx-get="/data" hx-headers='{"X-Custom": "value"}'></div>

<!-- Push URL to browser history -->
<a hx-get="/page" hx-push-url="true">Navigate</a>
<a hx-get="/page" hx-push-url="/custom-url">Custom URL</a>

<!-- Confirm dialog -->
<button hx-delete="/item" hx-confirm="Delete this item?">Delete</button>

<!-- Disable element during request -->
<button hx-post="/save" hx-disabled-elt="this">Save</button>

<!-- Swap out of band (update multiple elements) -->
<div id="status" hx-swap-oob="true">Updated from another response</div>
```

## Events

htmx fires events on elements throughout the request lifecycle.

```js
// Request lifecycle events
document.body.addEventListener('htmx:beforeRequest', (e) => {
  console.log('Request starting:', e.detail.elt);
});

document.body.addEventListener('htmx:afterRequest', (e) => {
  console.log('Request complete:', e.detail.xhr.status);
});

document.body.addEventListener('htmx:afterSwap', (e) => {
  console.log('DOM swapped:', e.detail.target);
  // Re-initialize JS on new content here
});

document.body.addEventListener('htmx:responseError', (e) => {
  console.error('Server error:', e.detail.xhr.status);
});
```

Key events:

| Event | When |
|-------|------|
| `htmx:beforeRequest` | Before AJAX request fires |
| `htmx:afterRequest` | After request completes |
| `htmx:beforeSwap` | Before DOM swap |
| `htmx:afterSwap` | After DOM swap |
| `htmx:afterSettle` | After settle phase |
| `htmx:responseError` | Non-2xx response |
| `htmx:sendError` | Network error |
| `htmx:load` | Element processed by htmx |

## Boosting (hx-boost)

Progressively enhance standard links and forms to use AJAX.

```html
<!-- Boost all child links and forms -->
<body hx-boost="true">
  <nav>
    <a href="/">Home</a>       <!-- becomes AJAX -->
    <a href="/about">About</a> <!-- becomes AJAX -->
  </nav>
  <form action="/search" method="get">  <!-- becomes AJAX -->
    <input name="q" />
  </form>
</body>

<!-- Opt out specific links -->
<a href="/download" hx-boost="false">Download file</a>
```

Boosted pages fall back to standard navigation when JS is disabled.

## WebSockets and SSE

### WebSockets

```html
<!-- Connect and receive messages -->
<div hx-ws="connect:/ws/chat">
  <div hx-ws="send:subscribe" hx-vals='{"channel": "general"}'></div>
  <div hx-ws="send" hx-trigger="load">Join</div>

  <!-- Send a message -->
  <form hx-ws="send">
    <input name="message" />
    <button>Send</button>
  </form>
</div>
```

### Server-Sent Events (SSE)

```html
<div hx-sse="connect:/events/status">
  <!-- Listen for events and swap content -->
  <div hx-sse="swap:message" hx-target="this">
    Waiting for updates...
  </div>

  <!-- Trigger htmx requests on SSE events -->
  <div hx-sse="swap:notification"
       hx-get="/notifications/latest"
       hx-target="#notif-area"
       hx-swap="afterbegin">
  </div>
</div>
```

## Extensions

htmx supports extensions for additional functionality.

```html
<!-- Include extension -->
<script src="https://unpkg.com/htmx.org/dist/ext/json-enc.js"></script>

<!-- Use extension -->
<form hx-post="/api/data" hx-ext="json-enc">
  <input name="title" value="Hello" />
  <!-- Sends {"title": "Hello"} as JSON instead of form-encoded -->
</form>
```

Popular extensions: `json-enc`, `alpine-morph`, `class-tools`, `loading-states`, `head-support`, `preload`.

## Common Patterns

### Lazy Loading

```html
<div hx-get="/expensive-content" hx-trigger="revealed" hx-swap="outerHTML">
  <div class="spinner">Loading...</div>
</div>
```

### Infinite Scroll

```html
<!-- Server returns items + next page trigger -->
<div id="items">
  <!-- items 1-10 -->
</div>
<div hx-get="/api/items?page=2" hx-trigger="revealed" hx-swap="afterend">
  <div class="spinner">Loading more...</div>
</div>
```

### Active Search

```html
<input
  hx-get="/api/search"
  hx-trigger="input changed delay:300ms, search"
  hx-target="#results"
  hx-indicator="#spinner"
  name="q"
/>
<div id="results"></div>
<img id="spinner" class="htmx-indicator" src="/spinner.gif" />
```

### Inline Editing

```html
<!-- Display mode -->
<div hx-target="this" hx-swap="outerHTML">
  <span>{{ item.name }}</span>
  <button hx-get="/items/{{ item.id }}/edit">Edit</button>
</div>

<!-- Edit mode (returned by server) -->
<form hx-put="/items/{{ item.id }}" hx-target="this" hx-swap="outerHTML">
  <input name="name" value="{{ item.name }}" />
  <button>Save</button>
  <button hx-get="/items/{{ item.id }}">Cancel</button>
</form>
```

### Click to Load

```html
<button hx-get="/api/items?page=2" hx-target="this" hx-swap="outerHTML">
  Load More Items
</button>
```

## See Also

- [htmx Documentation](https://htmx.org/docs)
- [htmx Reference](https://htmx.org/reference)
- [htmx Examples](https://htmx.org/examples)
- [htmx GitHub](https://github.com/bigskysoftware/htmx)
