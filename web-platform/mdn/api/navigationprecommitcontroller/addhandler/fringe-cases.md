# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if:
    - The originating {{domxref("NavigateEvent")}} was not intercepted or has been canceled.
    - The {{domxref("Document")}} is not fully active.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the event {{domxref("Event/isTrusted","isTrusted")}} attribute is `false`.

