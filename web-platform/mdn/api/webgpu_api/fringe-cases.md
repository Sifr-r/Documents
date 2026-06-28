# Fringe Cases

## Warnings & Notes

> [!NOTE]
  > The above diagram assumes a device with only one GPU.

> [!NOTE]
> In our demos we are storing our shader code inside a template literal, but you can store it anywhere from which it can easily be retrieved as text to be fed into your WebGPU program. For example, another common practice is to store shaders inside a {{htmlelement("script")}} element and retrieve the contents using {{domxref("Node.textContent")}}. The correct mime type to use for WGSL is `text/wgsl`.

> [!NOTE]
> The best practice for determining the texture format is to use the {{domxref("GPU.getPreferredCanvasFormat()")}} method; this selects the most efficient format (either `bgra8unorm` or `rgba8unorm`) for the user's device.

> [!NOTE]
> You could retrieve an implicit layout to use when creating a bind group by calling the {{domxref("GPUComputePipeline.getBindGroupLayout()")}} method. There is also a version available for render pipelines: see {{domxref("GPURenderPipeline.getBindGroupLayout()")}}.

> [!NOTE]
> The historic way of handling errors in WebGL is to provide a {{domxref("WebGLRenderingContext.getError", "getError()")}} method to return error information. This is problematic in that it returns errors synchronously, which is bad for performance — each call requires a round-trip to the GPU and requires all previously issued operations to be finished. Its state model is also flat, meaning that errors can leak between unrelated code. The creators of WebGPU were determined to improve on this.

## Security Notes

The whole API is available only in a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

