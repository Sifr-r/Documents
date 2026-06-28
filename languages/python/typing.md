# Python — Type Hints

## Basic Annotations

```python
# Variables (requires from __future__ import annotations for forward refs)
name: str = "Ada"
count: int = 0
items: list[str] = []
mapping: dict[str, int] = {}

# Functions
def greet(name: str, age: int = 0) -> str:
    return f"{name} is {age}"

# Optional (Union with None)
from typing import Optional  # pre-3.10
tag: str | None = None       # 3.10+ preferred

# Union
value: int | str             # 3.10+
value: Union[int, str]       # pre-3.10
```

## Collection Types

```python
# Built-in generics (3.9+)
names: list[str] = []
coords: tuple[int, int] = (0, 0)
unique: set[int] = {1, 2}
config: dict[str, str | int] = {}

# typing module equivalents (pre-3.9)
from typing import List, Tuple, Set, Dict
names: List[str] = []

# Sequence/Iterable (prefer abstract types for parameters)
from collections.abc import Sequence, Iterable, Mapping
def process(items: Iterable[str]) -> Sequence[str]:
    return list(items)
```

## Advanced Types

```python
from typing import Literal, TypedDict, Protocol, Final, TypeGuard

# Literal
Method = Literal["GET", "POST", "PUT", "DELETE"]
def request(method: Method) -> None: ...

# TypedDict (typed dicts)
class User(TypedDict):
    name: str
    age: int
    email: str | None

u: User = {"name": "Ada", "age": 30, "email": None}

# Protocol (structural subtyping)
class Drawable(Protocol):
    def draw(self) -> None: ...

def render(obj: Drawable) -> None:
    obj.draw()

# Final (no override / no reassign)
API_URL: Final = "https://api.example.com"
class Base:
    def method(self) -> None: ...
class Sub(Base):
    def method(self) -> None: ...  # error if Base.method is Final

# TypeGuard (user-defined type narrowing)
def is_str_list(val: list[object]) -> TypeGuard[list[str]]:
    return all(isinstance(x, str) for x in val)

values: list[object] = ["a", "b"]
if is_str_list(values):
    values[0].upper()  # type-checker knows this is str
```

## Generics

```python
from typing import TypeVar, Generic

T = TypeVar("T")

class Stack(Generic[T]):
    def __init__(self) -> None:
        self._items: list[T] = []

    def push(self, item: T) -> None:
        self._items.append(item)

    def pop(self) -> T:
        return self._items.pop()

stack: Stack[int] = Stack()
stack.push(1)
val: int = stack.pop()

# Constrained TypeVar
S = TypeVar("S", str, bytes)

# ParamSpec (capture callable signatures)
from typing import Callable, ParamSpec, Concatenate
P = ParamSpec("P")
R = TypeVar("R")

def log_call(fn: Callable[P, R]) -> Callable[P, R]:
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
        print(f"Calling {fn.__name__}")
        return fn(*args, **kwargs)
    return wrapper
```

## `Any` vs `object` vs `NoReturn`

```python
from typing import Any, NoReturn

def dynamic(x: Any) -> Any: ...  # opt out of type checking
def concrete(x: object) -> int: ... # any object, but must return int
def forever() -> NoReturn: ...  # never returns (raises or infinite loop)
```

## See Also

- [core.md](core.md) — runtime types
- [functions.md](functions.md) — callable types, decorators
