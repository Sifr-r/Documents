# Fringe Cases

## Warnings & Notes

> [!NOTE]
> As mentioned above, when calculating a relative color the first thing the browser does is to convert the provided origin color (`red` in the above example) into a value compatible with the color function being used (in this case, `rgb()`). This is done so that the browser is able to calculate the output color from the origin color. While the calculations are performed relative to the color function used, the actual output color value depends on the color's color space:
>
> - Older sRGB color functions cannot express the full spectrum of visible colors. The output colors of ([`hsl()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl), [`hwb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hwb), and [`rgb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb)) are serialized to `color(srgb)` to avoid these limitations. That means that querying the output color value via the {{domxref("HTMLElement.style")}} property or the {{domxref("CSSStyleDeclaration.getPropertyValue()")}} method returns the output color as a [`color(srgb ...)`](/en-US/docs/Web/CSS/Reference/Values/color_value/color) value.
> - For more recent color functions (`lab()`, `oklab()`, `lch()`, and `oklch()`), relative color output values are expressed in the same syntax as the color function used. For example, if a [`lab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lab) color function is being used, the output color will be a `lab()` value.

> [!NOTE]
> If you are using relative color syntax but outputting the same color as the origin color or a color not based on the origin color at all, you are not really creating a relative color. You'd be unlikely to ever do this in a real codebase, and would probably just use an absolute color value instead. But, we felt it useful to explain that you _can_ do this with relative color syntax, as a starting point for learning about it.

> [!NOTE]
> You can find additional examples demonstrating the use of relative color syntax in the different functional notation types on their dedicated pages: [`color()`](/en-US/docs/Web/CSS/Reference/Values/color_value/color#using_relative_colors_with_color), [`hsl()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl#using_relative_colors_with_hsl), [`hwb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hwb#using_relative_colors_with_hwb), [`lab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lab#using_relative_colors_with_lab), [`lch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lch#using_relative_colors_with_lch), [`oklab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklab#using_relative_colors_with_oklab), [`oklch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklch#using_relative_colors_with_oklch), [`rgb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb#using_relative_colors_with_rgb).

> [!NOTE]
> For brevity, only the parts of the CSS relevant to relative color usage are shown.

