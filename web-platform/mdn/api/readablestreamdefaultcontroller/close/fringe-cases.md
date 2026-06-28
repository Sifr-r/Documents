# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `close()` is called when the stream is not readable — because it is already closed, cancelled, or errored — or because it has been requested to close by the underlying source but it has not yet done so because there are still enqueued chunks to read.

