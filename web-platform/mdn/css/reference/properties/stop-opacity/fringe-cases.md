# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `stop-opacity` property only applies to {{SVGElement('stop')}} elements nested in an {{SVGElement("svg")}}. It doesn't apply to other SVG, HTML, or pseudo-elements.

> [!NOTE]
> Because we used the same `stop-opacity` value for all the sibling `<stop>` elements in the linear gradient, we could have instead used a single `<linearGradient>` with fully opaque stops, and set a value for each `<polygon>`s {{cssxref("fill-opacity")}} property instead.

