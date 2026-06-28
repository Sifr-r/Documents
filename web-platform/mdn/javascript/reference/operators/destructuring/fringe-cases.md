# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The parentheses `( ... )` around the assignment statement are required when using object literal destructuring without a declaration.
>
> `{ a, b } = { a: 1, b: 2 }` is not valid stand-alone syntax, as the `{ a, b }` on the left-hand side is considered a block and not an object literal according to the rules of [expression statements](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement). However, `({ a, b } = { a: 1, b: 2 })` is valid, as is `const { a, b } = { a: 1, b: 2 }`.
>
> If your coding style does not include trailing semicolons, the `( ... )` expression needs to be preceded by a semicolon, or it may be used to execute a function on the previous line.

