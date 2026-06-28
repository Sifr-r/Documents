# Fringe Cases

## Exceptions

- `InvalidModificationError` {{domxref("DOMException")}}
  - : Thrown if `recursive` is set to `false` and the entry to be removed is a directory with children.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Thrown if the browser was not able to get an exclusive lock on the entry.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if {{domxref('PermissionStatus')}} is not `granted`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the entry is not found.

