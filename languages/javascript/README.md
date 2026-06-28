# JavaScript / TypeScript

Modern JavaScript (ES2020+) and TypeScript reference. Covers runtime semantics
(V8, Node, Deno, Bun), not browser-specific DOM APIs (see `web-platform/`).

## Topics

> **Note:** The documentation structure is currently being migrated from single `.md` files per topic to nested directories (e.g., `functions/`) to provide deeper context via backlinks and fringe case documentation.

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, operators, control flow, strict mode |
| [functions/README.md](functions/README.md) | Declarations, arrow functions, closures, `this`, generators |
| [async/README.md](async/README.md) | Promises, async/await, event loop, AbortController |
| [modules.md](modules.md) | ESM, CommonJS, dynamic import, import attributes |
| [patterns.md](patterns.md) | Common idioms, destructuring, optional chaining, nullish coalescing |

## Quick Reference

```js
// Null checks
const val = obj?.prop?.deep ?? 'default';

// Async
const data = await fetch(url).then(r => r.json());

// Destructure
const { a, b: renamed, ...rest } = obj;

// Template literals
const msg = `Hello ${name}`;

// Spread
const merged = { ...defaults, ...overrides };
const copy = [...arr, newItem];

// Optional catch binding
try { ... } catch { /* no error var needed */ }

// Top-level await (ESM only)
const config = await import('./config.js');
```
