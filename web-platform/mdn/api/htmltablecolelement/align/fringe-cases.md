# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This property is deprecated, and CSS should be used to align text horizontally in a column. Use the CSS {{cssxref("text-align")}} property, which takes precedence, to horizontally align text in a column instead.
>
> As {{htmlelement("td")}} are not children of {{htmlelement("col")}}, you can't set it directly on a {{HTMLElement("col")}} element, you need to select the cells of the column using a `td:nth-last-child(n)` or similar (`n` is the column number, counting from the end).

