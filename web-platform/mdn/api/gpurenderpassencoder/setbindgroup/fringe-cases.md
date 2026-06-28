# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Study the other [WebGPU Samples](https://webgpu.github.io/webgpu-samples/) for more examples of `setBindGroup()` usage.

## Exceptions

For `setBindGroup()` calls that use a {{jsxref("Uint32Array")}} value for `dynamicOffsets`, the call will throw with a `RangeError` {{domxref("DOMException")}} if:

- `dynamicOffsetsStart` is less than 0.
- `dynamicOffsetsStart` + `dynamicOffsetsLength` is greater than `dynamicOffsets.length`.

