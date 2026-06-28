# JavaScript — Modules

## ESM (ECMAScript Modules)

ESM is the standard module system. Used in browsers (`<script type="module">`),
Node.js (`.mjs` or `"type": "module"` in package.json), Deno, Bun.

```js
// Named exports
export const PI = 3.14159;
export function add(a, b) { return a + b; }
export class Point { }

// Default export (one per module)
export default function main() { }

// Aggregate re-export
export { foo, bar } from './other.js';
export { default as OtherDefault } from './other.js';
export * from './other.js'; // re-exports all named (not default)

// Named imports
import { PI, add } from './math.js';

// Default import
import main from './main.js';

// Namespace import
import * as math from './math.js';

// Side-effect import
import './init.js';

// Dynamic import (returns Promise)
const module = await import('./lazy.js');
const { default: Component } = await import('./Component.js');
```

## CommonJS (CJS)

Node.js legacy system. Synchronous, runtime resolution.

```js
// Export
module.exports = function main() { };
exports.helper = () => {};

// Import
const main = require('./main');
const { helper } = require('./helpers');
```

## Key Differences

| Feature | ESM | CommonJS |
|---|---|---|
| Syntax | `import` / `export` | `require()` / `module.exports` |
| Loading | Async, static analysis | Sync, runtime |
| `this` at top level | `undefined` | `module.exports` |
| Live bindings | Yes (imports are live references) | No (copy of value) |
| Top-level await | Yes | No |
| Tree-shakeable | Yes | No |
| File extension | `.mjs`, `.js` (with type) | `.cjs`, `.js` (without type) |

```js
// ESM live bindings example
// counter.js
export let count = 0;
export function increment() { count++; }

// main.js
import { count, increment } from './counter.js';
console.log(count); // 0
increment();
console.log(count); // 1 — live binding reflects update!
```

## Interop (CJS ↔ ESM)

```js
// ESM importing CJS (Node.js)
import cjsModule from './legacy.cjs'; // default import gets module.exports
// Named imports work for CJS if static analysis can determine keys

// CJS importing ESM (requires dynamic import)
const esmModule = await import('./modern.mjs');
```

## Import Attributes (ES2025)

```js
import config from './data.json' with { type: 'json' };

// Dynamic
const data = await import('./data.json', { with: { type: 'json' } });

// Worker
new Worker('./worker.js', { type: 'module' });
```

## See Also

- [core.md](core.md) — general syntax
- [async.md](async.md) — dynamic import, top-level await
