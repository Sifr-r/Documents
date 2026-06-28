# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `ArrayBuffer()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

> [!NOTE]
> It is recommended that `maxByteLength` is set to the smallest value possible for your use case. It should never exceed `1073741824` (1GB) to reduce the risk of out-of-memory errors.

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - `length` or `maxByteLength` is larger than {{jsxref("Number.MAX_SAFE_INTEGER")}} (≥ 2<sup>53</sup>) or negative.
    - `length` is larger than `maxByteLength`.

