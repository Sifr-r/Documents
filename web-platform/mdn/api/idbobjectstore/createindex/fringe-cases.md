# Fringe Cases

## Exceptions

This method may raise a {{domxref("DOMException")}} of one of the following types:

- `ConstraintError` {{domxref("DOMException")}}
  - : Thrown if an index with the same name already exists in the database. Index names are case-sensitive.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if the provided key path is a sequence, and `multiEntry` is set to `true` in the `objectParameters` object.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if:
    - The method was not called from a `versionchange` transaction mode callback, i.e., from inside an {{domxref("IDBOpenDBRequest.upgradeneeded_event", "onupgradeneeded")}} handler.
    - The object store has been deleted.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if the provided `keyPath` is not a [valid key path](https://w3c.github.io/IndexedDB/#valid-key-path).
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if the transaction this {{domxref("IDBObjectStore")}}
    belongs to is not active (e.g., has been deleted or removed.) In Firefox
    previous to version 41, an `InvalidStateError` was raised in
    this case as well, which was misleading; this has now been fixed (see
    [Firefox bug 1176165](https://bugzil.la/1176165).)

