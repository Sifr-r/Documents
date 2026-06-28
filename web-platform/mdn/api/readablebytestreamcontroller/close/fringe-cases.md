# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Readers will still be able to read any previously-enqueued chunks from the stream, but once those are read, the stream will become closed.
> However if there is an outstanding and partially written {{domxref("ReadableByteStreamController.byobRequest","byobRequest")}} when `close()` is called, the stream will be errored.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the source object is not a `ReadableByteStreamController`, it is already closed, or the stream is not readable for some other reason.

