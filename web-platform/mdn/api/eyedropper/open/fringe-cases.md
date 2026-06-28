# Fringe Cases

## Exceptions

Exceptions are not thrown but returned when the {{jsxref("Promise")}} is rejected.

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if `open()` is not called via a [transient user activation](/en-US/docs/Glossary/Transient_activation).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if another eye dropper has already opened.
- `AbortError` {{domxref("DOMException")}}
  - : Thrown if the user aborts the selection by pressing the <kbd>Esc</kbd> key or if the selection is aborted by an {{domxref("AbortController")}} being passed as an argument to `open()`.
- `OperationError` {{domxref("DOMException")}}
  - : Thrown if the selection fails for other reasons.

