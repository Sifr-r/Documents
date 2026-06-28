# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the name is not a valid string or contains characters not allowed on the file system.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref('PermissionStatus.state')}} for the handle is not `'granted'` in `readwrite` mode.
- `InvalidModificationError` {{domxref("DOMException")}}
  - : Thrown if `recursive` is set to false and the entry to be removed has children.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the current entry is not found or if the entry of the specific name is not found or matched.

