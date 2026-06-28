# Fringe Cases

## Exceptions

- `IndexSizeError` {{domxref("DOMException")}}
  - : Thrown if `dataArray` is specified, but its length is not `(bytesPerPixel * width * height)`, or a multiple of `(bytesPerPixel * width)` if `height` is not specified. `bytesPerPixel` is `4` when `pixelFormat` is `"rgba-unorm8"` and `8` otherwise.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if `dataArray` is of type {{jsxref("Uint8ClampedArray")}} and `pixelFormat` is not set to `"rgba-unorm8"`, or if `dataArray` is of type {{jsxref("Float16Array")}} and `pixelFormat` is not set to `"rgba-float16"`.

