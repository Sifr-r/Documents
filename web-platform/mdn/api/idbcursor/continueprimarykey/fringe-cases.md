# Fringe Cases

## Exceptions

This method may raise a {{domxref("DOMException")}} of one of the following types:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if this `IDBCursor`'s transaction is inactive.
- `DataError` {{domxref("DOMException")}}
  - : Thrown if the key parameter has any of the following conditions:
    - The key is not a valid key.
    - The key is less than or equal to this cursor's position and the cursor's direction is `next` or `nextunique`.
    - The key is greater than or equal to this cursor's position and this cursor's direction is `prev` or `prevunique`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the cursor is currently being iterated or has iterated past its end.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if the cursor's direction is not `prev` or `next`.

