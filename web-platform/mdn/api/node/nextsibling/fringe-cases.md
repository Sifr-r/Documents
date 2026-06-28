# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Browsers insert {{domxref("Text")}} nodes into a document to represent whitespace in the source markup.
> Therefore a node obtained, for example, using [`Node.firstChild`](/en-US/docs/Web/API/Node/firstChild)
> or [`Node.previousSibling`](/en-US/docs/Web/API/Node/previousSibling)
> may refer to a whitespace text node rather than the actual element the author
> intended to get.
>
> The section [Working with whitespace in the DOM](/en-US/docs/Web/CSS/Guides/Text/Whitespace#working_with_whitespace_in_the_dom)
> contains more information about this behavior.
>
> You can use {{domxref("Element.nextElementSibling")}} to obtain the next element
> skipping any whitespace nodes, other between-element text, or comments.
>
> To navigate the opposite way through the child nodes list use [Node.previousSibling](/en-US/docs/Web/API/Node/previousSibling).

