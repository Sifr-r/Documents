# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Because the [root element](/en-US/docs/Web/HTML/Reference/Elements/html) has a different background painting area, the `background-clip` property has no effect when specified on it. See "[The backgrounds of special elements.](https://drafts.csswg.org/css-backgrounds-3/#special-backgrounds)"

> [!NOTE]
> For documents whose [root element](/en-US/docs/Web/HTML/Reference/Elements/html) is an HTML element: if the computed value of {{cssxref("background-image")}} on the root element is `none` and its {{cssxref("background-color")}} is `transparent`, user agents must instead propagate the computed values of the `background` properties from that element's first HTML {{HTMLElement("body")}} child element. The used values of that `<body>` element's `background` properties are their initial values, and the propagated values are treated as if they were specified on the root element. It is recommended that authors of HTML documents specify the canvas background for the `<body>` element rather than the HTML element.

