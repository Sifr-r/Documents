# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This is more important with [private fields](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements), because accessing a non-initialized private field throws a {{jsxref("TypeError")}}, even if the private field is declared below. (If the private field is not declared, it would be an early {{jsxref("SyntaxError")}}.)

> [!NOTE]
> Before the class fields specification was finalized with the `[[DefineOwnProperty]]` semantic, most transpilers, including [Babel](https://babeljs.io/) and [tsc](https://www.typescriptlang.org/), transformed class fields to the `DerivedWithConstructor` form, which has caused subtle bugs after class fields were standardized.

