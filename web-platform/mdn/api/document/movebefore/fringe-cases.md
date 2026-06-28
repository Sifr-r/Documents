# Fringe Cases

## Exceptions

- `HierarchyRequestError` {{jsxref("TypeError")}}
  - : Thrown in any of the following situations:
    - The specified `movedNode` is not part of this document.
    - The specified `movedNode` is not an {{domxref("Element")}} or {{domxref("CharacterData")}} node.
    - You are trying to move `movedNode` before the document's {{glossary("doctype")}} (represented by a {{domxref("DocumentType")}} object).
- `NotFoundError` {{jsxref("TypeError")}}
  - : The specified `referenceNode` is not a child of the node you are calling `moveBefore()` on, that is, the node you are trying to move `movedNode` inside.
- `TypeError` {{jsxref("TypeError")}}
  - : The second argument was not supplied.

