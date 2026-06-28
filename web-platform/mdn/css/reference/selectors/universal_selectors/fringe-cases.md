# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The universal selector (`*`) matches **elements only**.
> It does **not** directly match pseudo-elements by itself.
>
> To match all {{cssxref("::before")}} pseudo-elements on a page, for example, you would have to use a selector like `*::before`. This works because the `*` matches all elements, and the `::before` pseudo-element is available on all elements.

