# Fringe Cases

## Warnings & Notes

> [!NOTE]
> JavaScript does not have the distinction of "floating point numbers" and "integers" on the language level. `parseInt()` and [`parseFloat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseFloat) only differ in their parsing behavior, but not necessarily their return values. For example, `parseInt("42")` and `parseFloat("42")` would return the same value: a {{jsxref("Number")}} 42.

> [!NOTE]
> Other prefixes like `0b`, which are valid in [number literals](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#binary), are treated as normal digits by `parseInt()`. `parseInt()` does _not_ treat strings beginning with a `0` character as octal values either. The only prefix that `parseInt()` recognizes is `0x` or `0X` for hexadecimal values — everything else is parsed as a decimal value if `radix` is missing. [`Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number) or [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) can be used instead to parse these prefixes.

