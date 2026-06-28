# Fringe Cases

## Exceptions

- `HierarchyRequestError` {{jsxref("TypeError")}}
  - : Thrown in any of the following situations:
    - The specified `movedNode` is already added to the DOM, and you are trying to move it inside a `DocumentFragment`.
    - You are trying to move `movedNode` between two different document fragments.
    - The specified `movedNode` is not an {{domxref("Element")}} or {{domxref("CharacterData")}} node.
- `NotFoundError` {{jsxref("TypeError")}}
  - : The specified `referenceNode` is not a child of the `DocumentFragment` you are calling `moveBefore()` on, that is, the fragment you are trying to move `movedNode` inside.
- `TypeError` {{jsxref("TypeError")}}
  - : The second argument was not supplied.

