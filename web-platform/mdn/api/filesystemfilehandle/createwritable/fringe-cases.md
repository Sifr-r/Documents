# Fringe Cases

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref('PermissionStatus.state')}} for the handle is not `'granted'` in `readwrite` mode.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if current entry is not found.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Thrown if the browser is not able to acquire a lock on the file associated with the file handle. This could be because `mode` is set to `exclusive` and an attempt is made to open multiple writers simultaneously.
- `AbortError` {{domxref("DOMException")}}
  - : Thrown if implementation-defined malware scans and safe-browsing checks fails.

