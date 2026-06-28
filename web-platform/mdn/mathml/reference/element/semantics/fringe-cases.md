# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Legacy MathML specifications allowed renderers to decide the default rendering according to available annotations. The following rules for determining the visible child have been implemented in some browsers. See [MathML 4](https://w3c.github.io/mathml/) for the distinction between Presentation and Content MathML.
>
> - If no other rules apply: By default only the first child is rendered, which is supposed to be Presentation MathML.
> - If the first child is a Presentation MathML element other than `<annotation>` or `<annotation-xml>`, render the first child.
> - If no Presentation MathML is found, render the first `<annotation>` or `<annotation-xml>` child element of `<semantics>` without a `src` attribute. For `<annotation-xml>` elements the `encoding` attribute must be equal to one of following values:
>   - `"application/mathml-presentation+xml"`
>   - `"MathML-Presentation"`
>   - `"SVG1.1"`
>   - `"text/html"`
>   - `"image/svg+xml"`
>   - `"application/xml"`
>
> Note that `"application/mathml+xml"` is _not_ mentioned here as it does not distinguish between Content or Presentation MathML.

