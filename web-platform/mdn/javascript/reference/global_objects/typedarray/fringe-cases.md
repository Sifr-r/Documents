# Fringe Cases

## Warnings & Notes

> [!NOTE]
> All `TypedArray` subclasses' constructors can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call one without `new` throws a {{jsxref("TypeError")}}.

## Exceptions

All `TypeArray` subclass constructors operate in the same way. They would all throw the following exceptions:

- {{jsxref("TypeError")}}
  - : Thrown in one of the following cases:
    - A `typedArray` is passed but it is a [bigint](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) type while the current constructor is not, or vice versa.
    - A `typedArray` is passed but the buffer it's viewing is detached, or a detached `buffer` is directly passed.
- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - The new typed array's length is too large.
    - The length of `buffer` (if the `length` parameter is not specified) or `byteOffset` is not an integral multiple of the new typed array's element size.
    - `byteOffset` is not a valid array index (an integer between 0 and 2<sup>53</sup> - 1).
    - When creating a view from a buffer, the bounds are outside the buffer. In other words, `byteOffset + length * TypedArray.BYTES_PER_ELEMENT > buffer.byteLength`.

