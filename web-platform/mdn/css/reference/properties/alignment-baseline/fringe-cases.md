# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `alignment-baseline` property only has an effect on inline-level boxes, flex items, grid items, table cells, and the {{SVGElement("text")}}, {{SVGElement("textPath")}}, and {{SVGElement("tspan")}} SVG elements. If present, it overrides the shape's {{SVGAttr("alignment-baseline")}} attribute.

> [!NOTE]
> In SVG2, the `auto`, `before-edge`, and `after-edge` were deprecated and `text-before-edge` is an alias for `text-top`, and `text-after-edge` is an alias for `text-bottom`. These keywords should not be used as part of the {{cssxref("vertical-align")}} shorthand property. Browsers support `auto` as a synonym for `baseline` and `hanging`, wherein the alignment-point of the object being aligned is aligned with the "hanging" baseline of the parent text content element, but neither is part of the specification.

