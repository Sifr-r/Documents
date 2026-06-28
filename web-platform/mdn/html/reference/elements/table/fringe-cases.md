# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > While no HTML specification includes `height` as a `<table>` attribute, some browsers support a non-standard interpretation of `height`. The unitless value sets a minimum absolute height in pixels. If set as a percent value, the minimum table height will be relative to the parent container's height. Use the {{cssxref("min-height")}} CSS property instead, as this attribute is deprecated.

> [!NOTE]
> If the table structure is even more complex, the (additional) use of the [`headers`](/en-US/docs/Web/HTML/Reference/Elements/th#headers) attribute on the {{HTMLElement("th")}} and {{HTMLElement("td")}} elements may improve accessibility and help assistive technologies identify the relationships between cells; see [Complicated tables](#complicated_tables).

