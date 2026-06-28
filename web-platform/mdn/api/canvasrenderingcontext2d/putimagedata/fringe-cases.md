# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Image data can be retrieved from a canvas using the
> {{domxref("CanvasRenderingContext2D.getImageData()", "getImageData()")}} method.

> [!WARNING]
> Due to the lossy nature of converting to and from premultiplied alpha color values,
> pixels that have just been set using `putImageData()` might be returned to
> an equivalent `getImageData()` as different values.

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if any of the arguments is infinite.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the `ImageData` object's data has been detached.

