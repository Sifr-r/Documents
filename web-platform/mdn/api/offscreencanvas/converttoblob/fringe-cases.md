# Fringe Cases

## Exceptions

The promise may be rejected with the following exceptions:

- `InvalidStateError` {{domxref("DOMException")}}
  - : The `OffscreenCanvas` is not detached; in other words it still associated with the DOM and not the current worker.

- `SecurityError` {{domxref("DOMException")}}
  - : The canvas context mode is 2d and the bitmap is not origin-clean; at least some of its contents have or may have been loaded from a site other than the one from which the document itself was loaded.

- `IndexSizeError` {{domxref("DOMException")}}
  - : The canvas bitmap has no pixels (either the horizontal or vertical dimension is zero).

- `EncodingError` {{domxref("DOMException")}}
  - : The blob could not be created due to an encoding error.

