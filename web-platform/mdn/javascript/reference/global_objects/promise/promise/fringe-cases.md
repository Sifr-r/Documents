# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Promise()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

> [!NOTE]
> If your task is already promise-based, you likely do not need the `Promise()` constructor.

> [!NOTE]
> The existence of pending promises does not prevent the program from exiting. If the event loop is empty, the program exits despite any pending promises (because those are necessarily forever-pending).

