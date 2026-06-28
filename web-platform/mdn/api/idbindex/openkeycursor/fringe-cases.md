# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Cursors returned by `openKeyCursor()` do not
> make the referenced value available as [`IDBIndex.openCursor`](/en-US/docs/Web/API/IDBIndex/openCursor) does.
> This makes obtaining a list of keys much more efficient.

## Exceptions

This method may raise a {{domxref("DOMException")}} of one of the following types:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if this {{domxref("IDBIndex")}}'s transaction is inactive.
- {{jsxref("TypeError")}}
  - : Thrown if the value for the direction parameter is invalid.
- `DataError` {{domxref("DOMException")}}
  - : Thrown if the key or key range provided contains an invalid key.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("IDBIndex")}} has been deleted or removed.

