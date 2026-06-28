# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the new `XRWebGLBinding` could not be created due to one of the following situations:
    - The {{domxref("XRSession")}} specified by `session` has already been
      stopped.
    - The specified WebGL context, `context`, [has been lost](/en-US/docs/Web/API/WebGLRenderingContext/isContextLost#usage_notes) for any reason, such as a GPU switch or reset.
    - The specified `session` is immersive but the `context` is
      not WebXR compatible.

