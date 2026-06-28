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

    # First to complete
    done, pending = await asyncio.wait(
        [task1, task2],
        return_when=asyncio.FIRST_COMPLETED,
    )
    for p in pending:
        p.cancel()
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

# Or with contextlib
from contextlib import asynccontextmanager

@asynccontextmanager
async def managed_resource():
    resource = await acquire()
    try:
        yield resource
    finally:
        await release(resource)
```

## Async Iteration

```python
class AsyncRange:
    def __init__(self, start, end):
        self.i = start
        self.end = end

    def __aiter__(self):
        return self

    async def __anext__(self):
        if self.i >= self.end:
            raise StopAsyncIteration
        await asyncio.sleep(0.1)
        self.i += 1
        return self.i - 1

async for n in AsyncRange(0, 5):
    print(n)

# Async comprehensions (3.6+)
result = [x async for x in async_gen() if x > 0]
mapping = {k: v async for k, v in async_pairs()}
```

## Synchronization Primitives

```python
# Lock
lock = asyncio.Lock()
async with lock:
    # critical section
    pass

# Semaphore (limit concurrency)
sem = asyncio.Semaphore(5)
async with sem:
    await make_request()

# Event
event = asyncio.Event()
await event.wait()   # block until set
event.set()           # wake all waiters

# Queue (producer-consumer)
queue = asyncio.Queue(maxsize=10)
await queue.put(item)
item = await queue.get()
queue.task_done()
```

## Running Sync Code in Async

```python
# Run blocking code in thread pool
result = await asyncio.to_thread(sync_function, arg1, arg2)
# Or: loop.run_in_executor(None, sync_fn, arg)
```

## Task Groups (3.11+)

```python
async def main():
    async with asyncio.TaskGroup() as tg:
        tg.create_task(fetch("a"))
        tg.create_task(fetch("b"))
    # All tasks complete here (or exception propagated)
```

## See Also

- [functions.md](functions.md) — generators, yield
- [patterns.md](patterns.md) — context manager patterns
- [typing.md](typing.md) — Awaitable, Coroutine types
