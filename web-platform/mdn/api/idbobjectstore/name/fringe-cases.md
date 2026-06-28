# Fringe Cases

## Exceptions

There are a several exceptions that can occur when you attempt to change an object
store's name.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if either the object store has been deleted or the current transaction is not an
    upgrade transaction; you can only rename indexes during upgrade transactions; that is,
    when the mode is `versionchange`.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if the current transaction is not active.
- `ConstraintError` {{domxref("DOMException")}}
  - : Thrown if an object store is already using the specified `name`.

