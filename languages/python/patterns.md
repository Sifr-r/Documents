# Python — Common Patterns

## Context Managers

```python
# Class-based
class ManagedFile:
    def __init__(self, path, mode):
        self.path = path
        self.mode = mode

    def __enter__(self):
        self.file = open(self.path, self.mode)
        return self.file

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.file.close()
        return False  # don't suppress exceptions

with ManagedFile("data.txt", "r") as f:
    content = f.read()

# Generator-based (contextlib)
from contextlib import contextmanager

@contextmanager
def managed_file(path, mode):
    f = open(path, mode)
    try:
        yield f
    finally:
        f.close()
```

## Dataclasses (3.7+)

```python
from dataclasses import dataclass, field

@dataclass
class Point:
    x: float
    y: float
    color: str = "black"

    @property
    def magnitude(self) -> float:
        return (self.x**2 + self.y**2) ** 0.5

@dataclass(frozen=True)
class FrozenPoint:
    x: float
    y: float

@dataclass
class ShoppingCart:
    items: list[str] = field(default_factory=list)

# Compare with regular class — dataclass auto-generates:
# __init__, __repr__, __eq__, (optionally) __hash__
```

## Match / Case (3.10+)

```python
def handle(value):
    match value:
        case 0:
            return "zero"
        case 1 | 2:
            return "one or two"
        case int(n) if n > 0:
            return f"positive {n}"
        case str(s):
            return f"string: {s}"
        case [first, *rest]:
            return f"list starting with {first}"
        case {"name": name, "age": age}:
            return f"{name}, {age}"
        case _:
            return "unknown"

# Matching class instances
match point:
    case Point(x=0, y=0):
        print("origin")
    case Point(x=x, y=y) if x == y:
        print("diagonal")
    case Point():
        print(f"point at {point.x}, {point.y}")
```

## Enum

```python
from enum import Enum, auto, StrEnum, IntEnum

class Color(Enum):
    RED = auto()
    GREEN = auto()
    BLUE = auto()

class Status(StrEnum):  # 3.11+
    ACTIVE = "active"
    INACTIVE = "inactive"

# Iterate
for color in Color:
    print(color.name, color.value)

# Lookup
Color["RED"]     # by name
Color(1)         # by value
```

## Error Handling Patterns

```python
# Exception chaining
try:
    process(data)
except ValueError as e:
    raise RuntimeError("Processing failed") from e

# Exception groups (3.11+)
try:
    raise ExceptionGroup("errors", [
        ValueError("bad value"),
        TypeError("wrong type"),
    ])
except* ValueError as eg:
    print(f"Value errors: {eg.exceptions}")
except* TypeError as eg:
    print(f"Type errors: {eg.exceptions}")

# Suppressing context
try:
    process(data)
except ValueError:
    raise RuntimeError("Failed") from None  # hide original
```

## Property & Descriptors

```python
class Temperature:
    def __init__(self, celsius):
        self._celsius = celsius

    @property
    def celsius(self):
        return self._celsius

    @celsius.setter
    def celsius(self, value):
        if value < -273.15:
            raise ValueError("Below absolute zero")
        self._celsius = value

    @property
    def fahrenheit(self):
        return self._celsius * 9/5 + 32
```

## See Also

- [core.md](core.md) — basic syntax
- [functions.md](functions.md) — decorator patterns
- [typing.md](typing.md) — typed dataclasses, NamedTuple
