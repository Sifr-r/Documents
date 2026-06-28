# Fringe Cases

## Exceptions

Rather than throwing true exceptions, `requestReferenceSpace()` rejects the
returned promise with a {{domxref("DOMException")}} whose name is found in the list
below:

- `NotSupportedError`
  - : The requested reference space is not supported.

