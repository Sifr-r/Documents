# Fringe Cases

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref('PermissionStatus.state')}} for the handle is not `'granted'` in `readwrite` mode if the `create` option is set to `true` or in `read` mode if the `create` option is set to `false`.
- {{jsxref("TypeError")}}
  - : Thrown if the name specified is not a valid string or contains characters that would
    interfere with the native file system.
- `TypeMismatchError` {{domxref("DOMException")}}
  - : Thrown if the returned entry is a file and not a directory.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the current entry is not found or if the target directory doesn't exist and the `create` option is set to
    `false`.

