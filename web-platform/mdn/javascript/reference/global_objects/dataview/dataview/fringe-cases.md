# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `DataView()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown if the `byteOffset` or `byteLength` parameter values result in the view extending past the end of the buffer. In other words, `byteOffset + byteLength > buffer.byteLength`.

