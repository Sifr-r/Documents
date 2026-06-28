# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The first default parameter and all parameters after it will not contribute to the function's [`length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length).

> [!NOTE]
> Because the default parameter is evaluated when the function is called, not when the function is defined, the validity of the `await` and `yield` operators depends on the function itself, not its surrounding function. For example, if the current function is not `async`, `await` will be parsed as an identifier and follow normal [identifier syntax rules](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers), even when this function is nested in an `async` function.

