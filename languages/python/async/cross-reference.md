# Python Async — Cross-Reference

## JavaScript — Async / Promise

*   **Event Loop**: Both run on a single-threaded event loop. In JS, the loop is implicit and running constantly. In Python, you must explicitly start it with `asyncio.run()`.
*   **Coroutines vs Promises**: JS functions return a `Promise` which immediately starts executing. Python `async def` returns a coroutine object that does *nothing* until explicitly scheduled (via `await` or `create_task`).
*   **`asyncio.gather` vs `Promise.all`**: Very similar behavior. Both take multiple tasks/promises and return an array of results.
*   **Blocking**: Blocking the thread with sync code is disastrous in both languages.

[See JavaScript Async](../../javascript/async/README.md)
