# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > The encoding may result in values outside of the range `[0, 1]` being written to the target texture, if its format can represent them. Otherwise, the results are clamped to the target texture format's range. Conversion may not be necessary if `colorSpace` matches the source image color space.

        > [!NOTE]
        > If this option is set to `true` and the `source` is also premultiplied, the source RGB values must be preserved even if they exceed their corresponding alpha values.

## Exceptions

- `OperationError` {{domxref("DOMException")}}
  - : The method throws an `OperationError` if the following criteria are not met:
    - `source.origin.x` + the width of the region to copy to is less than or equal to the width of the source image.
    - `source.origin.y` + the height of the region to copy to is less than or equal to the height of the source image.
    - `source.origin.z` + the depthOrArrayLayers of the region to copy to is less than or equal to 1.
    - `dataOffset` is equal to or smaller than the size of `data`.
    - The size of `data` (when converted to bytes, in the case of `TypedArray`s) is a multiple of 4.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the image source data is cross-origin.

