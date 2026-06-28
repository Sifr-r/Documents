# Fringe Cases

## Exceptions

#### INVALID_EXPRESSION_ERR

If the expression is not legal according to the rules of the
{{domxref("XPathEvaluator")}}, a {{domxref("DOMException")}} of type
`INVALID_EXPRESSION_ERR` is raised.

#### TYPE_ERR

In case result cannot be converted to the specified type, a
{{domxref("DOMException")}} of type `TYPE_ERR` is raised.

#### NAMESPACE_ERR

If the expression contains namespace prefixes which cannot be resolved by the specified
`XPathNSResolver`, a {{domxref("DOMException")}} of type
`NAMESPACE_ERROR` is raised.

#### WRONG_DOCUMENT_ERR

If the provided context node is from a document that is not supported by the
{{domxref("XPathEvaluator")}}, a {{domxref("DOMException")}} of type
`WRONG_DOCUMENT_ERR` is raised.

#### NOT_SUPPORTED_ERR

If the provided context node is not a type permitted as an XPath context node or the
request type is not permitted by the {{domxref("XPathEvaluator")}}, a
{{domxref("DOMException")}} of type `NOT_SUPPORTED_ERR` is raised.

