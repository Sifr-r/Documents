# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `BigInt()` can only be called without [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to construct it with `new` throws a {{jsxref("TypeError")}}.

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown if the parameter is a non-integral number.
- {{jsxref("TypeError")}}
  - : Thrown in one of the following cases:
    - The parameter cannot be converted to a primitive.
    - After conversion to a primitive, the result is {{jsxref("undefined")}}, {{jsxref("null")}}, {{jsxref("symbol")}}.
- {{jsxref("SyntaxError")}}
  - : Thrown if the parameter is a string that cannot be parsed as a `BigInt`.

