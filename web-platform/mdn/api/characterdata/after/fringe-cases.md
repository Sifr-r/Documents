# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If you rather want to append text to the current node,
> the [`appendData()`](/en-US/docs/Web/API/CharacterData/appendData) method lets you append to the current node's data.

## Exceptions

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Thrown when the new nodes cannot be inserted at the specified point in the hierarchy,
    that is if one of the following conditions is met:
    - If the insertion of one of the added node would lead to a cycle, that is if one of them is an ancestor of this {{domxref("CharacterData")}} node.
    - If one of the added node is not a {{domxref("DocumentFragment")}}, a {{domxref("DocumentType")}}, an {{domxref("Element")}}, or a {{domxref("CharacterData")}}.
    - If this {{domxref("CharacterData")}} node is actually a {{domxref("Text")}} node, and its parent is a {{domxref("Document")}}.
    - If the parent of this {{domxref("CharacterData")}} node is a {{domxref("Document")}} and one of the nodes to insert is a {{domxref("DocumentFragment")}} with more than one {{domxref("Element")}} child, or that has a {{domxref("Text")}} child.

