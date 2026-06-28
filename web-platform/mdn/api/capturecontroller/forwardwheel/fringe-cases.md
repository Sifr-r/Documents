# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown when:
    - The capturing {{domxref("MediaStream")}} returned by the originating {{domxref("MediaDevices.getDisplayMedia()")}} call is no longer capturing, for example because the associated {{domxref("MediaStreamTrack")}} objects have had {{domxref("MediaStreamTrack.stop", "stop()")}} called on them.
    - The application is capturing itself.
    - An attempt is made to invoke `forwardWheel()` without transient activation, when permission to use it has not been granted by the user.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown when:
    - The page's {{HTTPHeader("Permissions-Policy/captured-surface-control", "captured-surface-control")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) does not permit the page to use the Captured Surface Control API.
    - Permission to capture the display surface is explicitly denied by the user.
- `NotSupportedError` {{domxref("DOMException")}}
  - : The surface type being captured is not a browser tab.

