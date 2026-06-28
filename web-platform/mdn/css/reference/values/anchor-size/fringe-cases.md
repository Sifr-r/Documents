# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Specifying an `<anchor-name>` inside an `anchor-size()` function neither associates nor tethers an element to an anchor; it only defines which anchor the element's property values should be set relative to.

    > [!NOTE]
    > If this parameter is omitted, the dimension defaults to the `<anchor-size>` keyterm that matches the axis of the property in which the function is included. For example, `width: anchor-size();` is equivalent to `width: anchor-size(width);`.

> [!NOTE]
> The anchor dimension you set the positioned element's property values relative to does not have to be along the same axis as the sizing value being set. For example, `width: anchor-size(height)` is valid.

