# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `rgba()` functional notation is an alias for `rgb()`. They are exactly equivalent. It is recommended to use `rgb()`.

> [!NOTE]
> For compatibility reasons, [Web API](/en-US/docs/Web/API/Window/getComputedStyle)-serialized color values are expressed as `rgb()` colors if the alpha channel value is exactly 1, and `rgba()` colors otherwise. In both cases, legacy syntax is used, with commas as separators (for example `rgb(255, 0, 0)`).

> [!NOTE]
> See [Missing color components](/en-US/docs/Web/CSS/Reference/Values/color_value#missing_color_components) for more information on the effect of `none`.

> [!NOTE]
> To fully enable the representation of the full spectrum of visible colors, the output of relative `rgb()` color functions is serialized to `color(srgb)`. That means that querying the output color value via the {{DOMxRef("HTMLElement.style")}} property or the {{DOMxRef("CSSStyleDeclaration.getPropertyValue()")}} method returns the output color as a [`color(srgb ...)`](/en-US/docs/Web/CSS/Reference/Values/color_value/color) value.

> [!NOTE]
> As mentioned above, if the output color is using a different color model to the origin color, the origin color is converted to the same model or space as the output color in the background so that it can be represented in a way that is compatible (i.e., using the same channels).

> [!NOTE]
> Because the origin color channel values are resolved to `<number>` values, you have to add numbers to them when using them in calculations, even in cases where a channel would normally accept `<percentage>`, `<angle>`, or other value types. Adding a `<percentage>` to a `<number>`, for example, doesn't work.

