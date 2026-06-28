# Fringe Cases

## Exceptions

This method may return a promise rejected with a {{domxref("DOMException")}} of one of the following types:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the environments document is not fully active.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if a lock manager cannot be obtained for the current environment.

