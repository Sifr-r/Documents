# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if no parameter is specified or the `type` is not that of an `ImageBitmapSource`.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the `imageBitmapSource` has an origin and is not the same as the document's origin, or if the `imageBitmapSource` is a {{domxref('HTMLCanvasElement')}} and its [origin-clean](https://html.spec.whatwg.org/multipage/canvas.html#concept-canvas-origin-clean) flag is set to `false`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the `imageBitmapSource` is an {{domxref('HTMLImageElement')}} and is not fully decoded or decoding failed, or is an {{domxref('HTMLVideoElement')}} and its {{domxref('HTMLMediaElement.readyState', 'readyState')}} is `HAVE_NOTHING` or `HAVE_METADATA`.

