# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the given child is a reference to an existing node in the document, `appendChild()` moves it from its current position to the new position.

> [!NOTE]
> Unlike this method, the {{domxref("Element.append()")}} method supports multiple arguments and appending strings. You can prefer using it if your node is an element.

## Exceptions

- `HierarchyRequestError` {{domxref("DOMException")}}
  - : Thrown when the constraints of the DOM tree are violated, that is if one of the following cases occurs:
    - If the parent of `child` is not a {{domxref("Document")}}, {{domxref("DocumentFragment")}}, or an {{domxref("Element")}}.
    - If the insertion of `child` would lead to a cycle, that is if `child` is an ancestor of the node.
    - If `child` is not a {{domxref("DocumentFragment")}}, a {{domxref("DocumentType")}}, an {{domxref("Element")}}, or a {{domxref("CharacterData")}}.
    - If the current node is a {{domxref("Text")}}, and its parent is a {{domxref("Document")}}.
    - If the current node is a {{domxref("DocumentType")}} and its parent is _not_ a {{domxref("Document")}}, as a _doctype_ should always be a direct descendant of a _document_.
    - If the parent of the node is a {{domxref("Document")}} and `child` is a {{domxref("DocumentFragment")}} with more than one {{domxref("Element")}} child, or that has a {{domxref("Text")}} child.
    - If the insertion of `child` would lead to {{domxref("Document")}} with more than one {{domxref("Element")}} as child.

