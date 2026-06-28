# Python Async — Alternatives

## TaskGroup vs `asyncio.gather`

In Python 3.11+, `asyncio.TaskGroup` is the preferred alternative to `asyncio.gather`. 

*   **Error Handling**: If a task fails in a `TaskGroup`, all other running tasks in the group are immediately cancelled. `gather` does not automatically cancel siblings on failure unless you write complex boilerplate.
*   **Readability**: The `async with` block makes the lifetime and bounds of the concurrent operations very clear.

```python
# Modern Alternative (3.11+)
async with asyncio.TaskGroup() as tg:
    tg.create_task(task1())
    tg.create_task(task2())

# Older approach (Pre 3.11)
await asyncio.gather(task1(), task2())
```

## Threading vs Asyncio

If you are dealing with blocking I/O that does not have an `async` library (e.g., standard file I/O or legacy database drivers), the alternative to rewriting it async is to run it in a thread executor.

```python
# Run a synchronous blocking function in the background
result = await asyncio.to_thread(sync_blocking_function, arg1)
```
