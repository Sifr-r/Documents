# JavaScript Async — Fringe Cases

## Microtask Starvation

If you recursively queue microtasks (e.g., using `Promise.resolve().then(...)` or `queueMicrotask`), the Event Loop will never move on to the Macrotask queue. This causes UI freezing and starvation of `setTimeout` or I/O events.

```js
function starve() {
  Promise.resolve().then(starve); // Microtask queue never empties
}
// Calling starve() will lock up the thread.
```

## Unhandled Promise Rejections

If a Promise rejects and there is no `.catch()` handler attached to it, Node.js used to emit a warning, but in modern versions, it crashes the process.

```js
function fireAndForget() {
  // BUG: If fetch fails, the app might crash depending on the environment.
  fetch('https://bad.url'); 
}

// FIX: Always catch fire-and-forget promises.
function safeFireAndForget() {
  fetch('https://bad.url').catch(console.error);
}
```
