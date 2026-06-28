# Fringe Cases

## Exceptions

This method doesn't throw exceptions; instead, it rejects the returned promise,
passing a {{domxref("DOMException")}} whose `name` is one of the
following:

- `AbortError`
  - : The scan operation was aborted with the {{DOMxRef("AbortSignal")}} passed in the `options` argument.
- `NotAllowedError`
  - : The permission for this operation was rejected or `overwrite` is
    `false` and there are already records on the tag.
- `NotSupportedError`
  - : There is no NFC adapter compatible with Web NFC, or the available NFC adapter does
    not support pushing messages, or connection can not be established.
- `NotReadableError`
  - : The UA is not allowed to access underlying NFC adapter (e.g., due to user
    preference).
- `NetworkError`
  - : Transfer failed after it already started (e.g., the tag was removed from the
    reader).

