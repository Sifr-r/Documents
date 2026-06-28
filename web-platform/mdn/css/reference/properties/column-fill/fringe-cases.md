# Fringe Cases

## Warnings & Notes

> [!WARNING]
> There are some interoperability issues and bugs with `column-fill` across browsers, due to unresolved issues in the specification.
>
> In particular, when using `column-fill: auto` to fill columns sequentially, Chrome will only consult this property if the multicol container has a size in the block dimension (e.g., height in a horizontal writing mode). Firefox will always consult this property, therefore filling the first column with all of the content in cases where there is no size.

