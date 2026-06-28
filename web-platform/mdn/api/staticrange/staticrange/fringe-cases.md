# Fringe Cases

## Exceptions

- `InvalidNodeTypeError`
  - : A {{domxref("DOMException")}} fired if either or both of the
    `startContainer` and/or `endContainer` are a type of node which
    you can't include in a range. Those node types
    are `Node.DOCUMENT_TYPE_NODE` (representing the {{domxref("DocumentType")}}
    node derived from the {{Glossary("Doctype", "DTD")}} identified using the `doctype`
    preamble in the HTML, for example) and the {{domxref("Attr")}} node describing an
    attribute of an element on the DOM.

