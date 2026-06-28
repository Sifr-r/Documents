# Fringe Cases

## Warnings & Notes

> [!NOTE]
> ECMAScript also has rules for automatic insertion of semicolons ([ASI](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion)) to end statements. (For more information, see the detailed reference about JavaScript's [lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar).)

> [!NOTE]
> You might also see a third type of comment syntax at the start of some JavaScript files, which looks something like this: `#!/usr/bin/env node`.
>
> This is called **hashbang comment** syntax, and is a special comment used to specify the path to a particular JavaScript engine that should execute the script. See [Hashbang comments](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#hashbang_comments) for more details.

> [!NOTE]
> Additionally, a best practice for `parseInt` is to always include the _radix_ parameter. The radix parameter is used to specify which numerical system is to be used.

> [!NOTE]
> Array literals create `Array` objects. See {{jsxref("Array")}} and [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) for details on `Array` objects.

> [!NOTE]
> [Trailing commas](/en-US/docs/Web/JavaScript/Reference/Trailing_commas) help keep git diffs clean when you have a multi-line array, because appending an item to the end only adds one line, but does not modify the previous line.
>
> ```diff
> const myList = [
>   "home",
>   "school",
> + "hospital",
> ];
> ```

> [!NOTE]
> Do not confuse the primitive Boolean values `true` and `false` with the true and false values of the {{jsxref("Boolean")}} object.
>
> The Boolean object is a wrapper around the primitive Boolean data type. See {{jsxref("Boolean")}} for more information.

> [!WARNING]
> Do not use an object literal at the beginning of a statement! This will lead to an error (or not behave as you expect), because the `{` will be interpreted as the beginning of a block.

