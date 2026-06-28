# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `is2D` property affects what transform, and therefore type of matrix that will be returned. CSS 2D and 3D transforms are different for legacy reasons. A brief explanation of 2D vs. 3D transforms can be found in [Using CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using).

## Exceptions

- {{jsxref("TypeError")}}
  - : Raised if any lengths involved in generating the matrix are not compatible units
    with px (such as relative lengths or percentages).

