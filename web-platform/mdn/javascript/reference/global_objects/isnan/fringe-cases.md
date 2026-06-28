# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The [`+` operator](/en-US/docs/Web/JavaScript/Reference/Operators/Addition) performs both number addition and string concatenation. Therefore, even if `isNaN()` returns `false` for both operands, the `+` operator may still return a string, because it's not used as an arithmetic operator. For example, `isNaN("1")` returns `false`, but `"1" + 1` returns `"11"`. To be sure that you are working with numbers, [coerce the value to a number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) and use {{jsxref("Number.isNaN()")}} to test the result.

