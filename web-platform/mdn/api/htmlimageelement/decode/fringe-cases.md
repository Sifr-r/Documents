# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Without a {{jsxref('Promise')}}-returning method, you would add the image to the DOM in a {{domxref("Window/load_event", "load")}} event handler, and handle the error in the {{domxref("HTMLElement/error_event", "error")}} event's handler.

## Exceptions

- `EncodingError` {{domxref("DOMException")}}
  - : An error occurred while decoding the image. This can happen if:
    - The request failed
    - The image request changed after calling `decode()` (for example, by changing its `src`)
    - The image's data is corrupted

