# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the method was not called from a `versionchange` transaction mode callback.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if the transaction this {{domxref("IDBObjectStore")}} belongs to is not active (e.g., has been deleted or removed.)
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if there is no index with the given name (case-sensitive) in the database.

