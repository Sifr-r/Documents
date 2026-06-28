# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Browsers insert text nodes into a document to represent whitespace in the source markup.
> Therefore a node obtained, for example, using [`Node.firstChild`](/en-US/docs/Web/API/Node/firstChild)
> or `Node.previousSibling`
> may refer to a whitespace text node rather than the actual element the author intended to get.
>
> See [Working with whitespace in the DOM](/en-US/docs/Web/CSS/Guides/Text/Whitespace#working_with_whitespace_in_the_dom) for more information.
>
> You can use [`previousElementSibling`](/en-US/docs/Web/API/Element/previousElementSibling)
> to get the previous element node (skipping text nodes and any other non-element nodes).
>
> To navigate the opposite way through the child nodes list use [Node.nextSibling](/en-US/docs/Web/API/Node/nextSibling).

