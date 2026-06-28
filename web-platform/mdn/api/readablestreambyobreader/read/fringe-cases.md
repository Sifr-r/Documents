# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : The source object is not a `ReadableStreamBYOBReader`, the stream has no owner, the view is not an object or has become detached, the view's length is 0, `options.min` is 0, or {{domxref("ReadableStreamBYOBReader.releaseLock()")}} is called (when there's a pending read request).
- {{jsxref("RangeError")}}
  - : The `options.min` value is larger than the view being written into.

