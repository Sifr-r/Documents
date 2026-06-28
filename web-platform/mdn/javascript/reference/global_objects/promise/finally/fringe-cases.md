# Fringe Cases

## Warnings & Notes

> [!NOTE]
> A `throw` (or returning a rejected promise) in the `finally` callback still rejects the returned promise. For example, both `Promise.reject(3).finally(() => { throw 99; })` and `Promise.reject(3).finally(() => Promise.reject(99))` reject the returned promise with the reason `99`.

> [!WARNING]
> This is only for demonstration purposes and is not a polyfill.

