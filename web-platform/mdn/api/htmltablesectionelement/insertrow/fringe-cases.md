# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `insertRow()` inserts the row directly into the
> section. The row does not need to be appended separately as would be the case if
> {{domxref("Document.createElement()")}} had been used to create the new
> `<tr>` element.

## Exceptions

- `IndexSizeError` {{domxref("DOMException")}}
  - : Thrown if `index` is greater than the number of rows, or smaller than `-1`.

