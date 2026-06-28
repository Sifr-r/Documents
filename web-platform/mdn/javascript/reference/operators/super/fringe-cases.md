# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `super` is a keyword and these are special syntactic constructs. `super` is not a variable that points to the prototype object. Attempting to read `super` itself is a {{jsxref("SyntaxError")}}.
>
> ```js-nolint example-bad
> const child = {
>   myParent() {
>     console.log(super); // SyntaxError: 'super' keyword unexpected here
>   },
> };
> ```

