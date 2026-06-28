# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{SVGAttr("color-interpolation-filters")}} property is only relevant to SVG filter operations. It has _no_ effect on filter primitives like {{SVGElement("feOffset")}}, {{SVGElement("feImage")}}, {{SVGElement("feTile")}}, and {{SVGElement("feFlood")}}, but instead applies to the various filter effect elements (e.g., {{SVGElement('feBlend')}}); see the SVG {{SVGAttr('color-interpolation-filters')}} page for a full list.

> [!NOTE]
> It is important to remember that the SVG {{SVGAttr('color-interpolation')}} attribute has an initial value of `sRGB`, while `color-interpolation-filters` has an initial value of `linearRGB`. This means, in the default case, filter effect interpolations occur in a different color space than all other color interpolations.

