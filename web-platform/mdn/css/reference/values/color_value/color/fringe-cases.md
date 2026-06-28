# Fringe Cases

## Warnings & Notes

> [!NOTE]
> See [Missing color components](/en-US/docs/Web/CSS/Reference/Values/color_value#missing_color_components) for more information on the effect of `none`.

    > [!NOTE]
    > Each of these values is usually between `0` and `1` but, as explained above, they may be outside these bounds.

    > [!NOTE]
    > Referencing `r`, `g`, and `b` values inside a `color()` function with a XYZ-based colorspace, `x`, `y`, and `z` values inside a `color()` function with an RGB-based colorspace, or any other characters, is invalid. The origin color channel values available inside the function must match the specified type of colorspace.

> [!NOTE]
> As mentioned above, if the output color is using a different color model to the origin color, the origin color is converted to the same model as the output color in the background so that it can be represented in a way that is compatible (i.e., using the same channels). For example, the {{cssxref("color_value/hsl", "hsl()")}} color `hsl(0 100% 50%)` is converted to `color(srgb 1 0 0)` in the first case above and `color(xyz 0.412426 0.212648 0.5)` in the second case.

> [!NOTE]
> Because the origin color channel values are resolved to `<number>` values, you have to add numbers to them when using them in calculations, even in cases where a channel would normally accept `<percentage>`, `<angle>`, or other value types. Adding a `<percentage>` to a `<number>`, for example, doesn't work.

