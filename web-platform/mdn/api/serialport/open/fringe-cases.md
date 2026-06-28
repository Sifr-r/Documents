# Fringe Cases

## Exceptions

The returned `Promise` rejects with one of the following exceptions:

- `InvalidStateError` {{domxref("DOMException")}}
  - : If `open()` is called when the port is already open.
- `NetworkError` {{domxref("DOMException")}}
  - : If the attempt to open the port failed.

