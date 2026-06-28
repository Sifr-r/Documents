# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > The identifiers **`"experimental-webgl"`** or **`"experimental-webgl2"`** are also used in implementations of WebGL.
    > These implementations have not reached test suite conformance, or the graphic drivers situation on the platform is not yet stable.
    > The [Khronos Group](https://www.khronos.org/) certifies WebGL implementations under certain [conformance rules](https://registry.khronos.org/webgl/sdk/tests/CONFORMANCE_RULES.txt).

    > [!NOTE]
    > The WebGPU specification does not define any specific context attributes for `getContext()`. Instead, it provides configuration options via the {{domxref("GPUCanvasContext.configure()")}} method.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Throws if the canvas has transferred to another context scope, for example, to worker.

