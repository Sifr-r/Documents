# Python — Core Syntax & Types

## Built-in Types

| Type | Mutable | Example |
|---|---|---|
| `int` | No | `42`, `0x2A`, `0o52`, `0b101010` |
| `float` | No | `3.14`, `1e-3` |
| `complex` | No | `1+2j` |
| `bool` | No | `True`, `False` (subclass of `int`) |
| `str` | No | `"hello"`, `'world'` |
| `bytes` | No | `b"hello"` |
| `list` | Yes | `[1, 2, 3]` |
| `tuple` | No | `(1, 2, 3)` |
| `set` | Yes | `{1, 2, 3}` |
| `frozenset` | No | `frozenset({1, 2})` |
| `dict` | Yes | `{"key": "value"}` |
| `NoneType` | N/A | `None` |

```python
type(42)           # <class 'int'>
isinstance(42, int) # True
issubclass(bool, int) # True — bool is a subclass of int!
```

## Truthiness

Falsy: `False`, `None`, `0`, `0.0`, `""`, `[]`, `{}`, `set()`, `()`, `range(0)`.
Custom objects are truthy by default unless `__bool__` or `__len__` returns falsy.

```python
items = []
first = items[0] if items else None
name = user_input or "default"
```

## Variables & Scope (LEGB)

Resolution order: **L**ocal → **E**nclosing → **G**lobal → **B**uilt-in

```python
x = "global"

def outer():
    x = "enclosing"
    def inner():
        x = "local"
        print(x)  # "local"
    inner()

# Keywords
global x     # assign to module-level variable
nonlocal x   # assign to enclosing (non-global) variable
```

## Control Flow

```python
# if/elif/else
if x > 0:
    pass
elif x < 0:
    pass
else:
    pass

# for loops (always iterate over iterables)
for item in items:
    print(item)

for i, item in enumerate(items):
    print(i, item)

for key, value in d.items():
    print(key, value)

# range
range(5)        # 0..4
range(2, 5)     # 2..4
range(0, 10, 2) # 0, 2, 4, 6, 8

# while
while condition:
    pass
else:           # runs if no break
    pass
```

## Comprehensions

```python
# List
squares = [x**2 for x in range(10) if x % 2 == 0]

# Dict
mapping = {x: x**2 for x in range(5)}

# Set
unique = {x for x in data if x is not None}

# Generator (lazy — use for large data)
gen = (x**2 for x in range(10**9))  # no memory cost

# Nested (flatten)
flat = [item for row in matrix for item in row]
```

## Sequence Operations

```python
# Slicing: seq[start:stop:step]
s = "hello"
s[1:4]    # "ell"
s[::-1]   # "olleh" (reverse)

# Unpacking
a, b = [1, 2]
a, *mid, b = [1, 2, 3, 4, 5]  # a=1, mid=[2,3,4], b=5

# Walrus operator (:=) — assignment expression (3.8+)
if (n := len(data)) > 10:
    print(f"Large: {n}")
```

## Dict Operations

```python
d = {"a": 1, "b": 2}

# Merge (3.9+)
d | {"c": 3}          # new dict

# Access
d.get("missing", 0)   # safe access with default
d.setdefault("k", [])  # get or set

# Ordered since Python 3.7 (guaranteed in 3.7+)
```

## Exception Handling

```python
try:
    result = risky()
except ValueError as e:
    log(e)
except (TypeError, KeyError):
    pass
else:                    # runs if no exception
    print("success")
finally:                 # always runs
    cleanup()

# Raise with cause (3.11+ exception groups)
raise RuntimeError("boom") from original_error
```

## See Also

- [functions.md](functions.md) — function definitions, decorators
- [typing.md](typing.md) — type hints
- [patterns.md](patterns.md) — context managers, dataclasses
