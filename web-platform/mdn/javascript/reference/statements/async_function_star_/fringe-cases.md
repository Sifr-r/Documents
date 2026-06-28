# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Async generator functions do not have arrow function counterparts.

> [!NOTE]
> `function` and `*` are separate tokens, so they can be separated by [whitespace or line terminators](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#white_space). However, there cannot be a line terminator between `async` and `function`, otherwise a semicolon is [automatically inserted](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion), causing `async` to become an identifier and the rest to become a `function*` declaration.

