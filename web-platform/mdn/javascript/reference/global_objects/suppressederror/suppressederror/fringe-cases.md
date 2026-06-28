# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `SuppressedError()` can be called with or without [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Both create a new `SuppressedError` instance.

> [!NOTE]
> `SuppressedError()` does not accept `options` like {{jsxref("Error/Error", "Error()")}} and other subclasses do, because the semantics of {{jsxref("Error/cause", "cause")}} overlaps with `suppressed`.

