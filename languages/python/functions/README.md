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

# Keyword-only (after *)
def f(a, *, b, c):
    pass
f(1, b=2, c=3)  # OK

# *args, **kwargs
def log(level: str, *messages: str, **metadata: str) -> None:
    for msg in messages:
        print(f"[{level}] {msg}")
```

## Lambda

Single-expression anonymous functions.

```python
square = lambda x: x**2
sorted(items, key=lambda x: x["name"])
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
```

## Generators

```python
# Generator function
def countdown(n: int):
    while n > 0:
        yield n
        n -= 1

# yield from — delegate to sub-generator
def flatten(nested):
    for item in nested:
        if isinstance(item, list):
            yield from flatten(item)
        else:
            yield item
```

## Related

- [fringe-cases.md](fringe-cases.md) — Mutable default arguments
- [alternatives.md](alternatives.md) — Comprehensions vs map/filter
- [cross-reference.md](cross-reference.md) — Python vs JS functions

## See Also
- [../core.md](../core.md) — control flow, comprehensions
- [../async/README.md](../async/README.md) — async generators
