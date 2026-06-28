# Fringe Cases

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if `"depth-sensing"` is not in the list of enabled features for this {{domxref("XRSession")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if:
    - the `XRFrame` is not active nor animated. Obtaining depth information is only valid within the {{domxref("XRSession.requestAnimationFrame()", "requestAnimationFrame()")}} callback.
    - the session's {{domxref("XRSession.depthUsage", "depthUsage")}} is not `"cpu-optimized"`.

