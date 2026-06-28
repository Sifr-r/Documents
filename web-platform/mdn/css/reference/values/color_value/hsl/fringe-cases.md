# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `hsla()` functional notation is an alias for `hsl()`. They are exactly equivalent. It is recommended to use `hsl()`.

> [!NOTE]
> `hsl()`/`hsla()` can also be written in a legacy form in which all values are separated with commas, for example `hsl(120, 75%, 25%)` or `hsla(120deg, 75%, 25%, 0.8)`. The `none` value is not permitted in the comma-separated legacy syntax, the `deg` on the hue value is optional, and the `%` units are required for the saturation and lightness values.

    > [!NOTE]
    > The angles corresponding to particular hues differ across the sRGB (used by `hsl()` and {{CSSXref("color_value/hwb", "hwb()")}}), CIELAB (used by {{CSSXref("color_value/lch", "lch()")}}), and Oklab (used by {{CSSXref("color_value/oklch", "oklch()")}}) color spaces. See the {{cssxref("hue")}} reference page for more detail and examples.

> [!NOTE]
> See [Missing color components](/en-US/docs/Web/CSS/Reference/Values/color_value#missing_color_components) for more information on the effect of `none`.

> [!NOTE]
> Absolute `hsl()` colors are serialized to {{CSSXref("color_value/rgb", "rgb()")}} values. The values of the red, green, and blue components may be rounded in serialization.

> [!NOTE]
> To fully enable the representation of the full spectrum of visible colors, the output of relative `hsl()` color functions is serialized to `color(srgb)`. That means that querying the output color value via the {{DOMxRef("HTMLElement.style")}} property or the {{DOMxRef("CSSStyleDeclaration.getPropertyValue()")}} method returns the output color as a [`color(srgb ...)`](/en-US/docs/Web/CSS/Reference/Values/color_value/color) value.

> [!NOTE]
> As mentioned above, if the output color is using a different color model to the origin color, the origin color is converted to the same model as the output color in the background so that it can be represented in a way that is compatible (i.e., using the same channels).

> [!NOTE]
> Because the origin color channel values are resolved to `<number>` values, you have to add numbers to them when using them in calculations, even in cases where a channel would normally accept `<percentage>`, `<angle>`, or other value types. Adding a `<percentage>` to a `<number>`, for example, doesn't work.

