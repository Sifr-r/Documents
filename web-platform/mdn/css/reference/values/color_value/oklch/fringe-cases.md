# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Usually when percentage values have a numeric equivalent in CSS, `100%` is equal to the number `1`.
> This is not the case for all of the `oklch()` component values. Here, `100%` is equal to `0.4` for the `C` value.

    > [!NOTE]
    > The `L` in `oklch()` is the perceived lightness, which refers to the "brightness" we visually perceive with our eyes. This is different from the `L` in `hsl()`, where it represents lightness as compared to other colors.

    > [!NOTE]
    > The angles corresponding to particular hues differ across the sRGB (used by {{CSSXref("color_value/hsl", "hsl()")}} and {{CSSXref("color_value/hwb", "hwb()")}}), CIELAB (used by {{CSSXref("color_value/lch", "lch()")}}), and Oklab (used by `oklch()`) color spaces. See the [Hues in `oklch()`](#hues_in_oklch) example below and the {{cssxref("hue")}} reference page for more details and examples.

> [!NOTE]
> See [Missing color components](/en-US/docs/Web/CSS/Reference/Values/color_value#missing_color_components) for more information on the effect of `none`.

> [!NOTE]
> As mentioned above, if the output color is using a different color model to the origin color, the origin color is converted to the same model as the output color in the background so that it can be represented in a way that is compatible (i.e., using the same channels).

> [!NOTE]
> Because the origin color channel values are resolved to `<number>` values, you have to add numbers to them when using them in calculations, even in cases where a channel would normally accept `<percentage>`, `<angle>`, or other value types. Adding a `<percentage>` to a `<number>`, for example, doesn't work.

