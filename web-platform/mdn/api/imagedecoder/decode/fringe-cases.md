# Fringe Cases

## Exceptions

If an error occurs, the promise will resolve with following exception:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if any of the following conditions apply:
    - `close` is true, meaning {{domxref("ImageDecoder.close()","close()")}} has already been called.
    - The requested frame does not exist.

