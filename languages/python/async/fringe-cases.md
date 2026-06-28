# Python Async — Fringe Cases

## Blocking the Event Loop

Python's event loop runs in a single thread. If you call a blocking synchronous function (like `time.sleep()`, `requests.get()`, or heavy CPU computation) inside an `async def`, the entire loop freezes.

```python
import asyncio
import time

async def bad_coroutine():
    # BUG: This blocks ALL other async tasks for 5 seconds
    time.sleep(5) 
    
async def good_coroutine():
    # FIX: This yields control back to the loop
    await asyncio.sleep(5)
```

## Unawaited Coroutines

Calling an `async def` function does *not* execute it. It returns a coroutine object. If you forget to `await` it, it will never run, and Python will raise a `RuntimeWarning`.

```python
async def do_work():
    pass

async def main():
    do_work()  # Warning: coroutine 'do_work' was never awaited
```
