# Fringe Cases

## Warnings & Notes

> [!NOTE]
> With respect to gradients, SVG treats the `transparent` keyword differently than CSS. SVG does not calculate gradients in pre-multiplied space, so `transparent` really means transparent black. So, specifying a `stop-color` with the value `transparent` is equivalent to specifying a `stop-color` with the value `black` and a {{SVGAttr("stop-opacity")}} with the value `0`.

> [!NOTE]
> As a presentation attribute, `stop-color` also has a CSS property counterpart: {{cssxref("stop-color")}}. When both are specified, the CSS property takes priority.

