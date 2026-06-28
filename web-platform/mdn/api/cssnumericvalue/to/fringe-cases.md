# Fringe Cases

## Exceptions

- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if an invalid unit was passed to the method.
- {{jsxref("TypeError")}}
  - : Thrown if:
    - The `CSSNumericValue` on which the method is being called can't be resolved to a single value and type.
      This might occur if the value is calculated from a variable when the value of that variable can't be known in the context.
    - The value can't be converted to the new unit because it's not of the same category.
      For example, you can't convert meters to seconds.

