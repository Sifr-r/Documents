# Fringe Cases

## Exceptions

This method may raise a {{domxref("DOMException")}} with a `name` of
one of the following types:

- `ConstraintError` {{domxref("DOMException")}}
  - : Thrown if an object store with the given name (based on a case-sensitive comparison)
    already exists in the connected database.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if `autoIncrement` is set to true and `keyPath` is
    either an empty string or an array.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the method was not called from a
    `versionchange` transaction callback.
- `SyntaxError`
  - : Thrown if the `keyPath` option contains an invalid key path.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if a request is made on a source database that does not exist
    (for example, when the database has been deleted or removed), or if the associated upgrade transaction has completed or is processing a request.

