# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This method produces the same result for: a) a record that doesn't exist in the database and b) a record that has an undefined value.
> To tell these situations apart, call the `openCursor()` method with the same key. That method provides a cursor if the record exists, and no cursor if it does not.

## Exceptions

This method may raise a {{domxref("DOMException")}} of one of the following types:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if this {{domxref("IDBObjectStore")}}'s transaction is inactive.
- `DataError` {{domxref("DOMException")}}
  - : Thrown if key or key range provided contains an invalid key.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("IDBObjectStore")}} has been deleted or removed.

