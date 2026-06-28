# Fringe Cases

## Exceptions

This method may raise a {{domxref("DOMException")}} of one of the following types:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if this IDBCursor's transaction is inactive.
- `ReadOnlyError` {{domxref("DOMException")}}
  - : Thrown if the transaction mode is read-only.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the cursor was created using {{domxref("IDBindex.openKeyCursor")}}, is currently being iterated, or has iterated past its end.
- `DataError` {{domxref("DOMException")}}
  - : Thrown if the underlying object store uses in-line keys and the property in the value at the object store's key path does not match the key in this
    cursor's position.
- `DataCloneError` {{domxref("DOMException")}}
  - : Thrown if the data being stored could not be cloned by the internal structured
    cloning algorithm.

