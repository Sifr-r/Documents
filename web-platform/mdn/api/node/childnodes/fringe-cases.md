# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{domxref("NodeList")}} being live means that its content is changed each time
> new children are added or removed.
>
> Browsers insert text nodes into a document to represent whitespace in the source markup.
> Therefore a node obtained, for example, using `Node.childNodes[0]`
> may refer to a whitespace text node rather than the actual element the author intended to get.
>
> See [Working with whitespace in the DOM](/en-US/docs/Web/CSS/Guides/Text/Whitespace#working_with_whitespace_in_the_dom) for more information.

> [!NOTE]
> Several calls to `childNodes` return the _same_ {{domxref("NodeList")}}.

