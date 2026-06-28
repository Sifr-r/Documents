# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("IDBDatabase.close", "close()")}} method has previously been called on this {{domxref("IDBDatabase")}} instance.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if an object store specified in the 'storeNames' parameter has been deleted or removed.
- {{jsxref("TypeError")}}
  - : Thrown if the value for the `mode` parameter is invalid.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if the function was called with an empty list of store names.

