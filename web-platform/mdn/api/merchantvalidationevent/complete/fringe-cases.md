# Fringe Cases

## Exceptions

This exception may be passed into the rejection handler for the promise:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the event did not come directly from the user agent, but was instead dispatched by other code. Another payment request is currently being processed, the current payment request is not currently being displayed to the user, or payment information is currently being updated.

