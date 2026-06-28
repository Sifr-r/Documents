# Fringe Cases

## Exceptions

This method may raise a {{domxref("DOMException")}} of one of the following types:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if this `IDBCursor`'s transaction is inactive.
- {{jsxref("TypeError")}}
  - : Thrown if the value passed into the `count` parameter was zero or a negative number.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the cursor is currently being iterated or has iterated past its end.

