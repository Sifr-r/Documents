# JavaScript — Async Patterns

## Promise

```js
// Creation
const p = new Promise((resolve, reject) => {
  setTimeout(() => resolve("done"), 1000);
  // On error: reject(new Error("failed"));
});

// States: pending → fulfilled | rejected (settled, immutable)

// Chaining
fetch(url)
  .then(res => res.json())
  .then(data => console.log(data))
  .catch(err => console.error(err))
  .finally(() => cleanup());

// Static methods
Promise.resolve(value);        // resolved promise
Promise.reject(error);         // rejected promise
Promise.all([p1, p2]);         // all resolve → array; any reject → reject
Promise.allSettled([p1, p2]);  // wait for all, get {status, value/reason}[]
Promise.race([p1, p2]);        // first to settle (resolve or reject)
Promise.any([p1, p2]);         // first to fulfill; all reject → AggregateError
```

## Async / Await

```js
async function fetchUser(id) {
  const res = await fetch(`/api/users/${id}`);
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  return res.json();
}

// Error handling
async function safe() {
  try {
    const user = await fetchUser(1);
  } catch (err) {
    console.error(err);
  }
}

// Top-level await (ESM modules only, not CommonJS)
const config = await fetch('/config.json').then(r => r.json());
```

## Event Loop

```
┌───────────────────────────┐
│   Call Stack (sync)       │
│   └─ runs to completion   │
├───────────────────────────┤
│   Microtask Queue          │
│   └─ Promises, queueMicrotask, MutationObserver │
├───────────────────────────┤
│   Macrotask Queue          │
│   └─ setTimeout, setInterval, I/O, UI events     │
└───────────────────────────┘
```

Order: Call stack empties → drain ALL microtasks → one macrotask → repeat.

[See fringe-cases.md for Microtask Starvation](fringe-cases.md)

## Related

- [fringe-cases.md](fringe-cases.md) — Event Loop starvation, unhandled rejections
- [alternatives.md](alternatives.md) — Promise.all vs sequential execution
- [cross-reference.md](cross-reference.md) — JS vs Python Async

## See Also
- [../core.md](../core.md) — types and syntax
- [../functions/README.md](../functions/README.md) — async generators, closures
