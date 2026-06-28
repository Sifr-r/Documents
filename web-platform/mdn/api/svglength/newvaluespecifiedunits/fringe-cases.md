# Fringe Cases

## Exceptions

This method may raise a {{domxref("DOMException")}} of one of the following types:

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if `unitType` is `SVG_LENGTHTYPE_UNKNOWN` or not a valid unit type constant.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Thrown if {{domxref("SVGLength")}} corresponds to a read-only attribute or when the object itself is read-only.

