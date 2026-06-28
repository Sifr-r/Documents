# Fringe Cases

## Warnings & Notes

> [!NOTE]
> While you can use `undefined` as an {{Glossary("identifier")}} (variable name) in any scope other than the global scope (because `undefined` is not a [reserved word](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words)), doing so is a very bad idea that will make your code difficult to maintain and debug.
>
> ```js example-bad
> // DON'T DO THIS
>
> (() => {
>   const undefined = "foo";
>   console.log(undefined, typeof undefined); // foo string
> })();
>
> ((undefined) => {
>   console.log(undefined, typeof undefined); // foo string
> })("foo");
> ```

> [!NOTE]
> The _strict equality_ operator (as opposed to the _loose equality_ operator) must be used here, because `x == undefined` also checks whether `x` is `null`, while strict equality doesn't. This is because `null` is not equivalent to `undefined`.
>
> See [Equality comparison and sameness](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness) for details.

