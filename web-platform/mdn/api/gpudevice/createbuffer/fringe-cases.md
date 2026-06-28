# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the buffer allocation fails without any specific side-effects, a {{domxref("GPUOutOfMemoryError")}} object is generated.

## Exceptions

- `RangeError` {{domxref("DOMException")}}
  - : Thrown if `mappedAtCreation` is set to `true`, and the specified `size` is not a multiple of `4`.

