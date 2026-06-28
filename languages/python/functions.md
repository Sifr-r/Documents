# Python — Functions

## Definition

```python
def greet(name: str, greeting: str = "Hello") -> str:
    """Return a greeting string."""
    return f"{greeting}, {name}"

# Positional-only (before /)
def f(a, b, /, c):
    pass
f(1, 2, c=3)  # OK
f(a=1, b=2)   # TypeError

# Keyword-only (after *)
def f(a, *, b, c):
    pass
f(1, b=2, c=3)  # OK
f(1, 2, 3)      # TypeError

# *args, **kwargs
def log(level: str, *messages: str, **metadata: str) -> None:
    for msg in messages:
        print(f"[{level}] {msg}")

log("INFO", "start", "done", user="admin")
```

## Lambda

Single-expression anonymous functions (no statements, no annotations).

```python
square = lambda x: x**2
sorted(items, key=lambda x: x["name"])
pairs = [(1, "b"), (2, "a")]
sorted(pairs, key=lambda p: p[1])  # [(2, "a"), (1, "b")]
```

## Decorators

```python
# Simple decorator
def log_call(fn):
    import functools
    @functools.wraps(fn)  # preserves __name__, __doc__
    def wrapper(*args, **kwargs):
        print(f"Calling {fn.__name__}")
        return fn(*args, **kwargs)
    return wrapper

@log_call
def add(a, b):
    return a + b

# Decorator with arguments
def retry(times: int):
    def decorator(fn):
        @functools.wraps(fn)
        def wrapper(*args, **kwargs):
            for attempt in range(times):
                try:
                    return fn(*args, **kwargs)
                except Exception:
                    if attempt == times - 1:
                        raise
        return wrapper
    return decorator

@retry(times=3)
def flaky_api():
    ...
```

## Generators

```python
# Generator function
def countdown(n: int):
    while n > 0:
        yield n
        n -= 1

for i in countdown(3):
    print(i)  # 3, 2, 1

# Generator expression (lazy)
squares = (x**2 for x in range(10))

# yield from — delegate to sub-generator
def flatten(nested):
    for item in nested:
        if isinstance(item, list):
            yield from flatten(item)
        else:
            yield item

# send() — two-way communication
def accumulator():
    total = 0
    while True:
        value = yield total
        if value is None:
            break
        total += value

acc = accumulator()
next(acc)       # prime the generator
acc.send(10)    # 10
acc.send(5)     # 15
acc.close()     # terminate
```

## Built-in Higher-Order Functions

```python
map(str, [1, 2, 3])         # ["1", "2", "3"]
filter(bool, [0, 1, 0, 2])   # [1, 2]
from functools import reduce
reduce(lambda a, b: a + b, [1, 2, 3])  # 6
```

## See Also

- [core.md](core.md) — control flow, comprehensions
- [async.md](async.md) — async generators
- [typing.md](typing.md) — Callable, ParamSpec
