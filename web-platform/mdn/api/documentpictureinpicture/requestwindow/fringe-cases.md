# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If one of `height` or `width` is specified, the other one must be too, otherwise an error is thrown. If both values are not specified, specified as 0, or set too large, the browser will clamp or ignore the values as appropriate to provide a reasonable user experience. The clamped size will vary depending on implementation, display size, and other factors.

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the API has been explicitly disabled (for example via browser settings).
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if:
    - `requestWindow()` is not called from a top-level `window` object.
    - `requestWindow()` is called from the `window` object of the Picture-in-Picture window (i.e., {{domxref("DocumentPictureInPicture.window")}}).
    - `requestWindow()` is called without {{Glossary("Transient_activation", "transient activation")}}.
- `RangeError` {{domxref("DOMException")}}
  - : Thrown if only one of `height` and `width` are set, or if `height` and `width` are set with negative values.

