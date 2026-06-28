# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The X, Y, and Z dimension values passed to {{domxref("GPUComputePassEncoder.dispatchWorkgroups()")}} and `dispatchWorkgroupsIndirect()` are the number of workgroups to dispatch for each dimension, not the number of shader invocations to perform across each dimension. This matches the behavior of modern native GPU APIs, but differs from the behavior of OpenCL. This means that if a {{domxref("GPUShaderModule")}} defines an entry point with `@workgroup_size(4, 4)`, and work is dispatched to it with the call `dispatchWorkgroupsIndirect(indirectBuffer);` with `indirectBuffer` specifying X and Y dimensions of 8 and 8, the entry point will be invoked 1024 times total — Dispatching a 4 x 4 workgroup 8 times along both the X and Y axes. `4 * 4 * 8 * 8 = 1024`.

