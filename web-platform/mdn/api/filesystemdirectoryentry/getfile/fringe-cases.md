# Fringe Cases

## Exceptions

- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the `create` option was not specified (or was specified as
    `false`), and the file doesn't exist.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the request to access the file was denied for security reasons.
- `TypeMismatchError` {{domxref("DOMException")}}
  - : Thrown if the path specified is not a file; it's probably a directory, but might be an
    unsupported file descriptor such as a pipe; this depends on the user agent to some
    extent.

