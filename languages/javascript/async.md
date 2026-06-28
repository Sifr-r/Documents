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

// Await vs .then() — sequential vs concurrent
const a = await fetchA();  // waits
const b = await fetchB();  // waits again (sequential)

const [a, b] = await Promise.all([fetchA(), fetchB()]); // concurrent

// Async iteration
for await (const chunk of stream) { }
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

```js
console.log("1");                  // sync
setTimeout(() => console.log("2"), 0); // macrotask
Promise.resolve().then(() => console.log("3")); // microtask
console.log("4");                  // sync
// Output: 1, 4, 3, 2
```

## Timers

```js
const id = setTimeout(() => {}, 1000);
const id = setInterval(() => {}, 1000);
clearTimeout(id);
clearInterval(id);

// Minimum delay is 4ms for nested timers; 0ms delay is clamped
```

## AbortController

```js
const controller = new AbortController();
const { signal } = controller;

fetch(url, { signal })
  .then(res => res.json())
  .catch(err => {
    if (err.name === "AbortError") console.log("cancelled");
  });

controller.abort(); // cancels fetch

// Abort with timeout
const id = setTimeout(() => controller.abort(), 5000);
// Or use AbortSignal.timeout(5000) (ES2023+)
fetch(url, { signal: AbortSignal.timeout(5000) });
```

## See Also

- [core.md](core.md) — types and syntax
- [functions.md](functions.md) — async generators, closures
- [patterns.md](patterns.md) — error handling patterns
