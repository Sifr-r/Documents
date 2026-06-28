# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This operation only works with an {{jsxref("Int32Array")}} or {{jsxref("BigInt64Array")}} that views a {{jsxref("SharedArrayBuffer")}}.
> It will return `0` on non-shared `ArrayBuffer` objects.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `typedArray` is not an {{jsxref("Int32Array")}} or {{jsxref("BigInt64Array")}}.
- {{jsxref("RangeError")}}
  - : Thrown if `index` is out of bounds in the `typedArray`.

