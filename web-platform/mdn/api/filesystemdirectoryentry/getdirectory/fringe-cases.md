# Fringe Cases

## Exceptions

- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the `create` option was not specified (or was specified as
    `false`), and the directory doesn't exist.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the request to access the directory was denied for security reasons.
- `TypeMismatchError` {{domxref("DOMException")}}
  - : Thrown if the path specified is not a directory; it's probably a file, but might be an
    unsupported file descriptor such as a pipe; this depends on the user agent to some
    extent.

