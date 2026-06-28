# JavaScript Async — Cross-Reference

## Python — Asyncio

*   **Promise vs Task/Future**: A JavaScript `Promise` is similar to Python's `asyncio.Future` or `Task`. However, in JavaScript, a Promise begins executing immediately upon creation. In Python, a coroutine does not start executing until it is scheduled on the event loop (e.g., via `await` or `asyncio.create_task()`).
*   **Promise.all vs asyncio.gather**: JS `Promise.all()` is equivalent to Python's `asyncio.gather()`. Python 3.11 introduced `TaskGroups`, which provide better error handling semantics than `gather()`.
*   **Event Loop**: JS has a single, implicit event loop provided by the runtime (V8/Node). Python requires explicit event loop management (usually handled via `asyncio.run()`).

[See Python Async](../../python/async/README.md)
