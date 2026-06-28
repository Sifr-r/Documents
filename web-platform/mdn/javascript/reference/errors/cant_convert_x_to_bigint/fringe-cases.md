# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Simply coercing the value to a string or number using [`String()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/String) or [`Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number) before passing it to `BigInt()` is usually not sufficient to avoid all errors. If the string is not a valid integer number string, a [SyntaxError](/en-US/docs/Web/JavaScript/Reference/Errors/Invalid_BigInt_syntax) is thrown; if the number is not an integer (most notably, {{jsxref("NaN")}}), a [RangeError](/en-US/docs/Web/JavaScript/Reference/Errors/Cant_be_converted_to_BigInt_because_it_isnt_an_integer) is thrown. If the range of input is unknown, properly validate it before using `BigInt()`.

