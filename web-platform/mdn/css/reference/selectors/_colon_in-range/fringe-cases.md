# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This pseudo-class only applies to elements that have (and can take) a range limitation. In the absence of such a limitation, the element can neither be "in-range" nor "out-of-range."

> [!NOTE]
> An empty `<input>` does not count as out of range, and will not be selected using the `:out-of-range` pseudo-class selector. The {{cssxref(":blank")}} pseudo-class exists to select blank inputs, although at the time of writing this is experimental and not well-supported. You could also use the `required` attribute and the {{cssxref(":invalid")}} pseudo-class to provide more general logic and styling for making inputs mandatory (`:invalid` will style blank _and_ out-of-range inputs).

