# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown in one of the following cases:
    - If `typedArray` is not an {{jsxref("Int32Array")}} or {{jsxref("BigInt64Array")}} that views a {{jsxref("SharedArrayBuffer")}}.
    - If the current thread cannot be blocked (for example, because it's the main thread).
- {{jsxref("RangeError")}}
  - : Thrown if `index` is out of bounds in the `typedArray`.

