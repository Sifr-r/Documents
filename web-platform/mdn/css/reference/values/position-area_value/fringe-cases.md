# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Generally, you can't mix different types in one value, e.g., physical and logical. To do so results in invalid values. For example, `position-area: bottom inline-end` is not a valid value because it mixes physical and logical keywords.

> [!NOTE]
> Trying to pair a row or column keyword with an inappropriate spanning keyword will result in an invalid value. For example, `right span-right` is invalid — you can't select the center-right grid tile and then try to span further to the right.

> [!NOTE]
> The specification defines `self` equivalents of these keywords — `block-self-start`, `block-self-end`, `inline-self-start`, and `inline-self-end`. However, these are not currently supported in any browser.

> [!NOTE]
> The specification defines `self` equivalents of these keywords, for example — `span-self-block-start`, `span-self-block-end`, `span-self-inline-start`, and `span-self-inline-end`. However, these are not currently supported in any browser.

> [!NOTE]
> Trying to pair a row or column keyword with an inappropriate spanning keyword will result in an invalid property value. For example, `block-end span-block-end` is invalid — you can't select the center block-end row and then try to span one tile further past the block end direction.

> [!NOTE]
> The specification doesn't define separate coordinate `self` spanning keywords, but these are not needed — the spanning keywords can be used with both coordinate row and column keywords.

