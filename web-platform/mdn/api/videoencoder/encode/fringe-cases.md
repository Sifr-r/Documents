# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("VideoEncoder.state","state")}} is not `"configured"`.
- `DataError` {{domxref("DOMException")}}
  - : Thrown if the given `frame` object's rotation and flip do not match the rotation and flip of the first {{domxref("VideoFrame")}} passed to `encode()` (the "active orientation").

