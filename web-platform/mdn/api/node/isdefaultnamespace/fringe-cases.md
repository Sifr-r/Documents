# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > `namespaceURI` is not an optional parameter, but can be `null`.

> [!NOTE]
> This example runs in an HTML document, where `xmlns:` attributes are ignored (except `xmlns:xlink`). Firefox sets all elements' namespace URI to `null`, while Chrome and Safari appropriately set HTML, SVG, and MathML elements' default namespace URIs. If you want to conduct more meaningful tests, you can open a standalone [SVG](/en-US/docs/Web/SVG) document and execute scripts in its context.

