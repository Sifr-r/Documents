# Fringe Cases

## Exceptions

- `HierarchyRequestError` {{jsxref("TypeError")}}
  - : Thrown in any of the following situations:
    - The specified `movedNode` is not part of the DOM, and you are trying to move it inside a node that is part of the DOM, or vice versa.
    - The specified `movedNode` is an ancestor of the Element `moveBefore()` is being called on.
    - You are trying to move `movedNode` between two different documents.
    - The specified `movedNode` is not an {{domxref("Element")}} or {{domxref("CharacterData")}} node.
- `NotFoundError` {{jsxref("TypeError")}}
  - : The specified `referenceNode` is not a child of the node you are calling `moveBefore()` on, that is, the node you are trying to move `movedNode` inside.
- `TypeError` {{jsxref("TypeError")}}
  - : The second argument was not supplied.

