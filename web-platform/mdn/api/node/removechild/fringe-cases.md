# Fringe Cases

## Warnings & Notes

> [!NOTE]
> As long as a reference is kept on the removed child,
> it still exists in memory, but is no longer part of the DOM.
> It can still be reused later in the code.
>
> If the return value of `removeChild()` is not stored, and no other reference is kept,
> it will be [automatically deleted](/en-US/docs/Web/JavaScript/Guide/Memory_management) from memory after a short time.

## Exceptions

- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the `child` is not a child of the node.
- {{jsxref("TypeError")}}
  - : Thrown if the `child` is `null`.

