# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `insertCell()` inserts the cell directly into the
> row. The cell does not need to be appended separately
> with {{domxref("Node.appendChild()")}} as would be the case if
> {{domxref("Document.createElement()")}} had been used to create the new
> `<td>` element.
>
> You can not use `insertCell()` to create a new `<th>`
> element though.

## Exceptions

- `IndexSizeError` {{domxref("DOMException")}}
  - : Thrown if `index` is greater than the number of cells.

