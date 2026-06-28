# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `trackOrKind` was not either `"audio"` or `"video"`.

    If the `sendEncodings` argument is used, this error may also be thrown if there is a badly formatted `rid` member, some but not all encodings contain a `rid` member, or different encodings have the same `rid` value.

- {{jsxref("RangeError")}}
  - : Thrown if any of the `sendEncodings` encodings have a `maxFramerate` value less than 0.0, or a `scaleResolutionDownBy` value of less than 1.0.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the method is called when the associated connection is closed.

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if the `sendEncodings` argument is used, and contains a read-only parameter other than `rid`.

