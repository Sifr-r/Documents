# Fringe Cases

## Exceptions

There are a several exceptions that can occur when you attempt to change an index's
name.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the index, or its object store, has been deleted or if the current transaction is not
    an upgrade transaction. You can only rename indexes during upgrade transactions; that
    is, when the mode is `"versionchange"`.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if the current transaction is not active.
- `ConstraintError` {{domxref("DOMException")}}
  - : Thrown if an index is already using the specified `name`.

