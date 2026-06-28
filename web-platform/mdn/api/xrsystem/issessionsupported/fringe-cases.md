# Fringe Cases

## Exceptions

Rather than throwing true exceptions, `isSessionSupported()` rejects the
returned promise, passing to the rejection handler a {{domxref("DOMException")}} whose
`name` is one of the following strings.

- `SecurityError`
  - : Use of this feature is blocked by an `xr-spatial-tracking` [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

