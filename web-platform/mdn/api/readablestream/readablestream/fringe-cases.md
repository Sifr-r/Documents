# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > You could define your own custom
    > `queuingStrategy`, or use an instance of
    > {{domxref("ByteLengthQueuingStrategy")}} or {{domxref("CountQueuingStrategy")}}
    > for this object value. If no `queuingStrategy` is supplied, the default
    > used is the same as a `CountQueuingStrategy` with a high water mark of
    > 1\.

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown if the supplied type value is neither `"bytes"` nor `undefined`.

