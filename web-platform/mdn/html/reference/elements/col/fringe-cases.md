# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Setting `text-align` on the `<col>` element has no effect as `<col>` has no descendants, and therefore no elements inherit from it.
    >
    > If the table does not use a [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan) attribute, use the `td:nth-of-type(an+b)` CSS selector. Set `a` to zero and `b` to the position of the column in the table, e.g., `td:nth-of-type(2) { text-align: right; }` to right-align the second column cells.
    >
    > If the table does use a [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan) attribute, the effect can be achieved by combining adequate CSS attribute selectors like `[colspan=n]`, though this is not trivial.

    > [!NOTE]
    > Setting `vertical-align` on the `<col>` element has no effect as `<col>` has no descendants, and therefore no elements inherit from it.
    >
    > If the table does not use a [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan) attribute, use the `td:nth-of-type(an+b)` CSS selector. Set `a` to zero and `b` to the position of the column in the table, e.g., `td:nth-of-type(2) { vertical-align: middle; }` to center the second column cells vertically.
    >
    > If the table does use a [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan) attribute, the effect can be achieved by combining adequate CSS attribute selectors like `[colspan=n]`, though this is not trivial.

