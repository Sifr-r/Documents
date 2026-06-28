# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This method is another name for {{DOMxRef("Document.hasUnpartitionedCookieAccess()")}}. There are no current plans to remove this method in favor of {{DOMxRef("Document.hasUnpartitionedCookieAccess()")}}.

> [!NOTE]
> If the promise gets resolved and a user gesture event was being processed when the function was originally called, the resolve handler will run as if a user gesture was being processed, so it will be able to call APIs that require user activation.

> [!NOTE]
> See [Using the Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using) for a more complete example.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the current {{domxref("Document")}} is not yet active.

