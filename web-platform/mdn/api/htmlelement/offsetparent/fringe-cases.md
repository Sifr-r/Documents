# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `offsetParent` returns `null` in the following situations:
>
> - The element or any ancestor has the `display` property set to
>   `none`.
> - The element has the `position` property set to `fixed` and its containing block is the viewport.
>   If the containing block is not the viewport, `offsetParent` returns the nearest ancestor that forms
>   a containing block, for example, an ancestor with `transform`, `perspective`, or `filter` styles set.
> - The element is `<body>` or `<html>`.

