# Fringe Cases

## Exceptions

If an error occurs, the promise will resolve with one of the following exceptions:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the Promise is rejected because the {{domxref("AudioDecoder.state","state")}} is not `configured`.

