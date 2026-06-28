# Fringe Cases

## Exceptions

This method doesn't throw traditional exceptions; instead, the promise rejects with one
of the following errors as the value passed into the rejection handler:

- `AbortError` {{domxref("DOMException")}}
  - : Returned if switching the context over to the WebXR-compatible context failed.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the WebGL context has been lost or there is no available WebXR device.

