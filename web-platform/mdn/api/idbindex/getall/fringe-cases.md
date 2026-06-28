# Fringe Cases

## Exceptions

This method may raise a {{domxref("DOMException")}} of the following types:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Thrown if this {{domxref("IDBIndex")}}'s transaction is inactive.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("IDBIndex")}} has been deleted or removed.
- {{jsxref("TypeError")}} {{domxref("DOMException")}}
  - : Thrown if the [`count`](#count) parameter is not between `0` and `2^32 - 1`, inclusive.

