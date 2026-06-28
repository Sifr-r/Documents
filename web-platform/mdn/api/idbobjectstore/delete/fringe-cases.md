# Fringe Cases

## Exceptions

This method may raise a {{domxref("DOMException")}} of the following types:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if this object store's transaction is inactive.
- `ReadOnlyError` {{domxref("DOMException")}}
  - : Thrown if the object store's transaction mode is read-only.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the object store has been deleted.
- `DataError` {{domxref("DOMException")}}
  - : Thrown if `key` is not a [valid key](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#key) or a [key range](/en-US/docs/Web/API/IDBKeyRange).

