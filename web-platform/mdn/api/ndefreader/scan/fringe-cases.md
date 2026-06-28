# Fringe Cases

## Exceptions

This method doesn't throw exceptions; instead, it rejects the returned promise,
passing a {{domxref("DOMException")}} whose `name` is one of the
following:

- `AbortError` {{domxref("DOMException")}}
  - : Returned if the scan operation was aborted with the {{DOMxRef("AbortSignal")}} passed in the `options` argument.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if there's already an ongoing scan.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Returned if the permission for this operation was rejected.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Returned if there is no NFC adapter compatible with Web NFC or a connection cannot be established.

