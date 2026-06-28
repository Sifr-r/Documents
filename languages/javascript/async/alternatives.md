# JavaScript Async — Alternatives

## Concurrency vs Sequential Execution

When dealing with multiple async operations, you can execute them sequentially (one after another) or concurrently (at the same time).

```js
// Sequential (Waits for fetchA to finish before starting fetchB)
const a = await fetchA();  
const b = await fetchB();  

// Concurrent / Parallel (Starts both immediately)
// Use this if B does not depend on the result of A.
const [a, b] = await Promise.all([fetchA(), fetchB()]); 
```

## Promise.all vs Promise.allSettled

```js
// Promise.all is "fail-fast". If one fails, the whole thing throws.
try {
  await Promise.all([fetchA(), failFetchB()]);
} catch (err) {
  // We lose the result of fetchA here!
}

// Promise.allSettled waits for all, regardless of success/fail.
const results = await Promise.allSettled([fetchA(), failFetchB()]);
// results = [{status: "fulfilled", value: A}, {status: "rejected", reason: B_Err}]
```
