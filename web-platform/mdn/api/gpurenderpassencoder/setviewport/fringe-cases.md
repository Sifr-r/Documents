# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If a `setViewport()` call is not made, the default values are `(0, 0, attachment width, attachment height, 0, 1)` for each render pass.

> [!NOTE]
> See the color and depth/stencil attachments specified in the descriptor of {{domxref("GPUCommandEncoder.beginRenderPass()")}}; the width and height are based on that of the {{domxref("GPUTexture")}} that their `view`s originate from.

