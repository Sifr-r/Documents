# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Variables do not work inside media queries and container queries.
> You can use the {{cssxref("var()")}} function in any part of a value in any property on an element.
> You cannot use {{cssxref("var()")}} for property names, selectors, or anything aside from property values, which means you can't use it in a media query or container query.

> [!NOTE]
> Custom property names are case sensitive — `--my-color` will be treated as a separate custom property to `--My-color`.

> [!NOTE]
> Fallback values aren't used to fix compatibility issues for when CSS custom properties are not supported, as the fallback value won't help in this case.
> Fallbacks cover the case where the browser supports CSS custom properties and is able to use a different value if the desired variable isn't defined yet or has an invalid value.

> [!NOTE]
> The syntax of the fallback, like that of custom properties, allows commas. For example, `var(--foo, red, blue)` defines a fallback of `red, blue` — anything between the first comma and the end of the function is considered a fallback value.

