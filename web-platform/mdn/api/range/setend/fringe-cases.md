# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `setEnd()` is commonly used in conjunction with
> {{domxref("Range.setStart", "setStart()")}} to fully configure a range.

## Exceptions

- `InvalidNodeTypeError` {{domxref("DOMException")}}
  - : The node specified by `endNode` is a doctype node; range endpoints cannot be located inside a doctype node.
- `IndexSizeError` {{domxref("DOMException")}}
  - : The value specified by `endOffset` is either greater than or equal to the length of the node or is less than zero.

