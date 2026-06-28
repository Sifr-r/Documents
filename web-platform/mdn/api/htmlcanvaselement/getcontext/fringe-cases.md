# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > The identifier `"experimental-webgl"` is used
    > in new implementations of WebGL. These implementations have either not reached
    > test suite conformance, or the graphics drivers on the platform are not yet
    > stable. The [Khronos Group](https://www.khronos.org/) certifies WebGL
    > implementations under certain [conformance rules](https://registry.khronos.org/webgl/sdk/tests/CONFORMANCE_RULES.txt).

    > [!NOTE]
    > The WebGPU specification does not define any specific context attributes for `getContext()`. Instead, it provides configuration options via the {{domxref("GPUCanvasContext.configure()")}} method.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Throws if the canvas has transferred its control to offscreen by calling {{domxref("HTMLCanvasElement.transferControlToOffscreen()")}}.

