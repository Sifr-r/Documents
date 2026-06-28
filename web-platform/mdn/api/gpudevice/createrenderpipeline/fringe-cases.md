# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > The `depthBias`, `depthBiasClamp`, and `depthBiasSlopeScale` properties must be set to `0` for line and point topologies, i.e., if [`topology`](#topology) is set to `"line-list"`, `"line-strip"`, or `"point-list"`. If not, a {{domxref("GPUValidationError")}} will be generated and the returned {{domxref("GPURenderPipeline")}} will be invalid.

        > [!NOTE]
        > The render state stencil value is initialized to 0 at the start of a render pass.

> [!NOTE]
> `depthStencilAttachment` values are specified during {{domxref("GPUCommandEncoder.beginRenderPass()")}} calls, when the {{domxref("GPURenderPipeline")}} is actually used to perform a render pass.

            > [!NOTE]
            > The `dual-source-blending` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) needs to be enabled for the `src1`, `one-minus-src1`, `src1-alpha`, and `one-minus-src1-alpha` blend factor operations to be used successfully. If not, a {{domxref("GPUValidationError")}} is generated.

        > [!NOTE]
        > For a detailed explanation of the algorithms defined by each `dstFactor`/`srcFactor` and `operation` enumerated value, see the [Blend State](https://gpuweb.github.io/gpuweb/#blend-state) section of the specification.

        > [!NOTE]
        > For the `r32float`, `rg32float`, and `rgba32float` formats to be used with [blending](#blend), the `float32-blendable` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) must be available in the device.

> [!NOTE]
> `colorAttachment` and `depthStencilAttachment` values are specified during {{domxref("GPUCommandEncoder.beginRenderPass()")}} calls, when the {{domxref("GPURenderPipeline")}} is actually used to perform a render pass.

    > [!NOTE]
    > The `frontFace` and `cullMode` values have no effect on the `"point-list"`, `"line-list"`, or `"line-strip"` topologies.

    > [!NOTE]
    > The `depth-clip-control` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) needs to be enabled for the `unclippedDepth` property to be used successfully. If not, a {{domxref("GPUValidationError")}} is generated.

> [!NOTE]
> The [WebGPU samples](https://webgpu.github.io/webgpu-samples/) feature many more examples.

