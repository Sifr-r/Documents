# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The example above uses a complex selector to insert content before every `li` except the last one. This could also be achieved using a complex selector targeting all `li` elements except the first:
>
> ```css
> .breadcrumb li:not(:first-child)::before {
>   content: "→";
> }
> ```
>
> Feel free to choose the solution that you prefer.

