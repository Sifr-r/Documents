# Fringe Cases

## Warnings & Notes

> [!WARNING]
    > If the new node is already present somewhere else in the DOM, it is first removed from that position.

> [!NOTE]
> The parameter order, _new_ before _old_, is unusual.
> [`Element.replaceWith()`](/en-US/docs/Web/API/Element/replaceWith), applying only to nodes that are elements,
> may be easier to read and use.

## Exceptions

- `HierarchyRequestError` {{domxref("DOMException")}}
  - : Thrown when the constraints of the DOM tree are violated, that is if one of the following cases occurs:
    - If the parent of `oldChild` is not a {{domxref("Document")}}, {{domxref("DocumentFragment")}}, or an {{domxref("Element")}}.
    - If the replacement of `oldChild` by `newChild` would lead to a cycle, that is if `newChild` is an ancestor of the node.
    - If `newChild` is not a {{domxref("DocumentFragment")}}, a {{domxref("DocumentType")}}, an {{domxref("Element")}}, or a {{domxref("CharacterData")}}.
    - If the current node is a {{domxref("Text")}}, and its parent is a {{domxref("Document")}}.
    - If the current node is a {{domxref("DocumentType")}} and its parent is _not_ a {{domxref("Document")}}, as a _doctype_ should always be a direct descendant of a _document_.
    - If the parent of the node is a {{domxref("Document")}} and `newChild` is a {{domxref("DocumentFragment")}} with more than one {{domxref("Element")}} child, or that has a {{domxref("Text")}} child.
    - If the replacement of `oldChild` by `newChild` would lead to {{domxref("Document")}} with more than one {{domxref("Element")}} as child.
    - If the replacement of `oldChild` by `newChild` would lead to the presence of an {{domxref("Element")}} node before a {{domxref("DocumentType")}} node.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the parent of `oldChild` is not the current node.

