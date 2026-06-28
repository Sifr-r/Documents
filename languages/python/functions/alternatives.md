# Python Functions — Alternatives

## List Comprehensions vs Higher-Order Functions

In Python, list comprehensions (and generator expressions) are generally preferred over `map` and `filter` because they are more readable and often faster.

```python
# Core (Built-in functions)
result = list(map(lambda x: x**2, filter(lambda x: x % 2 == 0, numbers)))

# Alternative (Comprehension - Preferred in Python)
result = [x**2 for x in numbers if x % 2 == 0]
```

## `functools.partial` vs `lambda`

If you need to pre-fill arguments of a function, you can use a `lambda`, but `functools.partial` is often clearer and preserves metadata better.

```python
from functools import partial

def power(base, exp):
    return base ** exp

# Alternative using Lambda
square_lambda = lambda x: power(x, 2)

# Alternative using partial
square_partial = partial(power, exp=2)
```
