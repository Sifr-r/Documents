# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `url` option enables the modification of a cookie scoped under a particular URL. Service workers can obtain cookies that would be sent to any URL under their scope. From a document you may only obtain the cookies at the current URL, so the only valid URL in a document context is the document's URL.

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the origin does not {{glossary("Serialization", "serialize")}} to a URL.
- {{jsxref("TypeError")}}
  - : Thrown if:
    - The method is called in the main thread, and the `url` option is specified but does not match the URL of the current window.
    - The method is called in a worker and the `url` option is specified, but does not match the origin of the worker.
    - Querying cookies represented by the given `name` or `options` fails.

