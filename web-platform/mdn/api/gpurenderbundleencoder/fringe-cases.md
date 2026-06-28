# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Currently set vertex buffers, index buffers, bind groups, and pipeline are all cleared prior to executing a render bundle, and once the render bundle has finished executing.

> [!NOTE]
> The methods of `GPURenderBundleEncoder` are functionally identical to their equivalents available on {{domxref("GPURenderPassEncoder")}}, except for {{domxref("GPURenderBundleEncoder.finish()")}}, which is similar in purpose to {{domxref("GPUCommandEncoder.finish()")}}.

