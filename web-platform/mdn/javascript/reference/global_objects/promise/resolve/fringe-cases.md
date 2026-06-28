# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If evaluating the `value` expression may synchronously throw an error, this error won't be caught and wrapped in a rejected promise by `Promise.resolve()`. Consider using {{jsxref("Promise/try", "Promise.try(() => value)")}} in this case.

> [!WARNING]
> Do not call `Promise.resolve()` on a thenable that resolves to itself. That leads to infinite recursion, because it attempts to flatten an infinitely-nested promise.

