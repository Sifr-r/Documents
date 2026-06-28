# Fringe Cases

## Exceptions

#### TYPE_ERR

In case {{domxref("XPathResult.resultType")}} is not
`UNORDERED_NODE_ITERATOR_TYPE` or `ORDERED_NODE_ITERATOR_TYPE`, a
{{domxref("DOMException")}} of type `TYPE_ERR` is thrown.

#### INVALID_STATE_ERR

If the document is mutated since the result was returned, a
{{domxref("DOMException")}} of type `INVALID_STATE_ERR` is thrown.

