# Fringe Cases

## Exceptions

If `addModule()` fails, it rejects the promise, delivering one of the
following errors to the rejection handler.

- `AbortError` {{domxref("DOMException")}}
  - : The specified script is invalid or could not be loaded.
- `SyntaxError` {{domxref("DOMException")}}
  - : The specified `moduleURL` is invalid.

