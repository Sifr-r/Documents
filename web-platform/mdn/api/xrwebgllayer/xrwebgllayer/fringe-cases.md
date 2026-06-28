# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the new `XRWebGLLayer` could not be created due to one of a number of
    possible state errors:
    - The {{domxref("XRSession")}} specified by `session` has already been
      stopped.
    - The specified WebGL context, `context`, [has been lost](/en-US/docs/Web/API/WebGLRenderingContext/isContextLost#usage_notes) for any reason, such as a GPU switch or reset.
    - The specified `session` is immersive but the `context` is
      not WebXR compatible.
- `OperationError` {{domxref("DOMException")}}
  - : Thrown if the resources (including memory buffers) needed for the layer to operate could not
    be allocated.

