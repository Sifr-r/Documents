# Fringe Cases

## Exceptions

This method may raise a {{domxref("DOMException")}} of
one of the following types:

- `ReadOnlyError` {{domxref("DOMException")}}
  - : Thrown if the transaction associated with this operation is in read-only <a href="/en-US/docs/Web/API/IDBTransaction#mode_constants">mode</a>.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if this {{domxref("IDBObjectStore")}}'s transaction is inactive.
- `DataError` {{domxref("DOMException")}}
  - : Thrown if any of the following conditions apply:
    - The object store uses in-line keys or has a key generator, and a key parameter was provided.
    - The object store uses out-of-line keys and has no key generator, and no key parameter was provided.
    - The object store uses in-line keys but no key generator, and the object store's key path does not yield a valid key.
    - The key parameter was provided but does not contain a valid key.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("IDBObjectStore")}} has been deleted or removed.
- `DataCloneError` {{domxref("DOMException")}}
  - : Thrown if the data being stored could not be cloned by the internal structured cloning algorithm.
- `ConstraintError` {{domxref("DOMException")}}
  - : Thrown if an insert operation failed because the primary key constraint was
    violated (due to an already existing record with the same primary key
    value).

