# Python Functions — Fringe Cases

## Mutable Default Arguments

Default arguments are evaluated **once** at function definition time, not at call time. If you use a mutable object (like a list or dict) as a default, it will be shared across all calls.

```python
# BAD: The list is shared
def add_item(item, target_list=[]):
    target_list.append(item)
    return target_list

add_item(1) # [1]
add_item(2) # [1, 2] ! Unexpected
```

**Solution:** Use `None` as the default and initialize inside the function.

```python
# GOOD:
def add_item(item, target_list=None):
    if target_list is None:
        target_list = []
    target_list.append(item)
    return target_list
```

## Late Binding Closures

Closures in Python bind late (to the variable, not the value at the time the function was created).

```python
# BAD: All functions will print 9
funcs = [lambda: i for i in range(10)]
```

**Solution:** Use a default argument to capture the value early.
```python
# GOOD:
funcs = [lambda i=i: i for i in range(10)]
```
