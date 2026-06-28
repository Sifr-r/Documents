# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This means that you shouldn't write a lazy getter for a property whose value you expect to change, because if the getter is lazy, then it will not recalculate the value.
>
> Note that getters are not "lazy" or "memoized" by nature; you must implement this technique if you desire this behavior.

