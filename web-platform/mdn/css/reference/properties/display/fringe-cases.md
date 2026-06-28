# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When a display property is specified with only an **outer** value (e.g., `display: block` or `display: inline`), the inner value defaults to `flow` (e.g., `display: block flow` and `display: inline flow`).

> [!NOTE]
> You may use the single-value syntax as a fallback for multi-keyword syntax, for example `display: inline flex` could have the following fallback
>
> ```css
> .container {
>   display: inline-flex;
>   display: inline flex;
> }
> ```
>
> See [Using the multi-keyword syntax with CSS display](/en-US/docs/Web/CSS/Guides/Display/Multi-keyword_syntax) for more information.

> [!NOTE]
> When a display property is specified with only an **inner** value (e.g., `display: flex` or `display: grid`), the outer value defaults to `block` (e.g., `display: block flex` and `display: block grid`).

> [!NOTE]
> If no inner value is specified, it will default to `flow`.
> If no outer value is specified, the principal box will have an outer display type of `block`.

