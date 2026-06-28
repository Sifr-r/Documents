# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the specified `rootNode` is not a compatible node type. The root node
    must be either {{domxref("Node")}} or {{domxref("Attr")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the tree could not be successfully serialized, probably due to issues with the
    content's compatibility with XML serialization.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if a serialization of HTML was requested but could not succeed due to the content not
    being well-formed.

