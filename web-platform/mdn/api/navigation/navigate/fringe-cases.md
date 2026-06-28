# Fringe Cases

## Exceptions

- `DataCloneError` {{domxref("DOMException")}}
  - : Thrown if the `state` parameter contains values that are not structured-cloneable.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the document is not currently active.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if the `url` parameter is not a valid URL.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if:
    - The `history` option is set to `push`, and the browser is currently showing the initial `about:blank` document.
    - The `url`'s scheme is `javascript`.

