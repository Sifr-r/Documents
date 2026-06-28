# Python

Modern Python (3.10+) reference. Covers CPython semantics, stdlib patterns,
and type annotations.

## Topics

> **Note:** The documentation structure is currently being migrated from single `.md` files per topic to nested directories (e.g., `functions/`) to provide deeper context via backlinks and fringe case documentation.

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, control flow, comprehensions |
| [functions/README.md](functions/README.md) | Definitions, lambdas, decorators, generators |
| [async/README.md](async/README.md) | asyncio, coroutines, tasks, event loop |
| [typing.md](typing.md) | Type hints, Protocol, TypedDict, generics |
| [patterns.md](patterns.md) | Context managers, dataclasses, match/case, error handling |

## Quick Reference

```python
# Null / None checks
val = obj.get("key", "default")
val = maybe or "default"

# Async
data = await httpx.get(url)

# Destructure (unpack)
a, b, *rest = [1, 2, 3, 4]

# f-strings
msg = f"Hello {name}"

# Dict merge
merged = {**defaults, **overrides}
merged = defaults | overrides  # Python 3.9+

# Context manager
async with aiofiles.open("f.txt") as f:
    content = await f.read()

# Match/case (Python 3.10+)
match value:
    case 1 | 2: ...
    case {"key": v}: ...
    case _: ...
```
