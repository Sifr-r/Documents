# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Image data can be painted onto a canvas using the
> {{domxref("CanvasRenderingContext2D.putImageData()", "putImageData()")}} method.

## Exceptions

- `IndexSizeError` {{domxref("DOMException")}}
  - : Thrown if either `sw` or `sh` are zero.
- `SecurityError` {{domxref("DOMException")}}
  - : The canvas contains or may contain pixels which were loaded from an origin other
    than the one from which the document itself was loaded.
    To avoid a `SecurityError` {{domxref("DOMException")}} being thrown in this situation,
    configure CORS to allow the source image to be used in this way.
    See [Allowing cross-origin use of images and canvas](/en-US/docs/Web/HTML/How_to/CORS_enabled_image).

