# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > The `span` attribute is not permitted if there are one or more {{HTMLElement("col")}} elements within the `<colgroup>`.

    > [!NOTE]
    > Setting `text-align` on the `<colgroup>` element has no effect as {{HTMLElement("td")}} and {{HTMLElement("th")}} elements are not descendants of the `<colgroup>` element, and therefore they do not inherit from it.
    >
    > If the table does not use a [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan) attribute, use the `td:nth-of-type(an+b)` CSS selector per column, where `a` is the total number of the columns in the table and `b` is the ordinal position of the column in the table, e.g., `td:nth-of-type(7n+2) { text-align: right; }` to right-align the second column cells.
    >
    > If the table does use a [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan) attribute, the effect can be achieved by combining adequate CSS attribute selectors like `[colspan=n]`, though this is not trivial.

    > [!NOTE]
    > Setting `vertical-align` on the `<colgroup>` element has no effect as {{HTMLElement("td")}} and {{HTMLElement("th")}} elements are not descendants of the `<colgroup>` element, and therefore they do not inherit from it.
    >
    > If the table does not use a [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan) attribute, use the [`td:nth-of-type()`](/en-US/docs/Web/CSS/Reference/Selectors/:nth-of-type) CSS selector per column, e.g., `td:nth-of-type(2) { vertical-align: middle; }` to center the second column cells vertically.
    >
    > If the table does use a [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan) attribute, the effect can be achieved by combining adequate CSS attribute selectors like `[colspan=n]`, though this is not trivial.

