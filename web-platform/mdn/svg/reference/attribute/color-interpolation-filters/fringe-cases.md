# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This property just has an affect on filter operations. Therefore, it has no effect on filter primitives like {{SVGElement("feOffset")}}, {{SVGElement("feImage")}}, {{SVGElement("feTile")}} or {{SVGElement("feFlood")}}.
>
> `color-interpolation-filters` has a different initial value than {{SVGAttr("color-interpolation")}}. `color-interpolation-filters` has an initial value of `linearRGB`, whereas `color-interpolation` has an initial value of `sRGB`. Thus, in the default case, filter effects operations occur in the linearRGB color space, whereas all other color interpolations occur by default in the sRGB color space.
>
> It has no affect on filter functions, which operate in the {{Glossary("RGB", "sRGB")}} color space.

> [!NOTE]
> As a presentation attribute, `color-interpolation-filters` also has a CSS property counterpart: {{cssxref("color-interpolation-filters")}}. When both are specified, the CSS property takes priority.

