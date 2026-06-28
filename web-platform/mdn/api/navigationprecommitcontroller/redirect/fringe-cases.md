# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `redirect()` method can convert the history behavior between `auto`, `push`, and `replace`, but it cannot turn a `traverse` navigation into a `push`/`replace` navigation and vice versa.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if:
    - The originating {{domxref("NavigateEvent")}} was not intercepted.
    - The {{domxref("NavigateEvent.navigationType")}} is not `push` or `replace`.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if the specified `url` is invalid.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the current document is unable to have its URL rewritten to the provided redirect `url`.

