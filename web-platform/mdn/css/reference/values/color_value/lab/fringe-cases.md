# Fringe Cases

## Warnings & Notes

> [!NOTE]
> See [Missing color components](/en-US/docs/Web/CSS/Reference/Values/color_value#missing_color_components) for more information on the effect of `none`.

> [!NOTE]
> Usually when percentage values have a numeric equivalent in CSS, `100%` is equal to the number `1`. This is not always the case for Lab's lightness and `a` and `b` axes, as mentioned above. With `L`, the range is from 0 to 100, with `100%` equal to `100`. The `a` and `b` values support both negative and positive values, with `100%` being equal to `125` and `-100%` being equal to `-125`.

> [!NOTE]
> As mentioned above, if the output color is using a different color model to the origin color, the origin color is converted to the same model as the output color in the background so that it can be represented in a way that is compatible (i.e., using the same channels).

> [!NOTE]
> Because the origin color channel values are resolved to `<number>` values, you have to add numbers to them when using them in calculations, even in cases where a channel would normally accept `<percentage>`, `<angle>`, or other value types. Adding a `<percentage>` to a `<number>`, for example, doesn't work.

