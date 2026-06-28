# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This property is deprecated, and CSS should be used to align text vertically in a column. Use the CSS {{cssxref("vertical-align")}} property, which takes precedence, to vertically align text in each column cell instead.
>
> As {{htmlelement("td")}} are not children of {{htmlelement("col")}}, you can't set it directly on a {{HTMLElement("col")}} element, you need to select the cells of the column using a `td:nth-child(n)` or similar (`n` is the column number).

