# Python — Async (asyncio)

## Coroutines

A coroutine is defined with `async def` and must be awaited or scheduled.

```python
import asyncio

async def fetch_data(url: str) -> dict:
    # Simulate I/O
    await asyncio.sleep(1)
    return {"url": url, "status": 200}

# Running
asyncio.run(fetch_data("http://example.com"))  # top-level entry point
```

## Tasks (Concurrency)

```python
async def main():
    # Concurrent — both run at the same time
    results = await asyncio.gather(
        fetch_data("url1"),
        fetch_data("url2"),
    )

    # Fire-and-forget
    task = asyncio.create_task(fetch_data("url1"))
    # ... do other work ...
    result = await task

    # Timeout
    try:
        result = await asyncio.wait_for(fetch_data("slow"), timeout=5.0)
    except asyncio.TimeoutError:
        print("timed out")
```

## Async Context Managers

```python
class AsyncResource:
    async def __aenter__(self):
        await self.connect()
        return self

    async def __aexit__(self, *args):
        await self.close()

async with AsyncResource() as res:
    await res.use()
```

## Task Groups (3.11+)

```python
async def main():
    async with asyncio.TaskGroup() as tg:
        tg.create_task(fetch("a"))
        tg.create_task(fetch("b"))
    # All tasks complete here (or exception propagated)
```

[See fringe-cases.md for Blocking the Event Loop](fringe-cases.md)

## Related

- [fringe-cases.md](fringe-cases.md) — Blocking the loop, unawaited coroutines
- [alternatives.md](alternatives.md) — TaskGroup vs gather
- [cross-reference.md](cross-reference.md) — Python vs JS async

## See Also
- [../patterns.md](../patterns.md) — Context manager patterns
- [../functions/README.md](../functions/README.md) — Generators, yield
