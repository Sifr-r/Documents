# Fringe Cases

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : The returned `Promise` rejects with this error in either of the following situations:
    - A {{httpheader('Permissions-Policy/serial','serial')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) blocks the use of this feature.
    - A user permission prompt was denied.

