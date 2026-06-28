# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : An attempt is made to invoke `resetZoomLevel()` without transient activation.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown when:
    - The page's {{HTTPHeader("Permissions-Policy/captured-surface-control", "captured-surface-control")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) does not permit the page to use the Captured Surface Control API.
    - Permission to capture the display surface is explicitly denied by the user.

