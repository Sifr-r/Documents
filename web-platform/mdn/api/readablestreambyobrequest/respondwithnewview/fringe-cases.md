# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the source object is not a `ReadableStreamBYOBRequest`, or there is no associated controller, or the associated internal array buffer is non-existent or detached.
    It may also be thrown if the `view` is zero-length when there is an active reader, or non-zero when called on a closed stream.

- {{jsxref("RangeError")}}
  - : Thrown if the new `view` does not match the backing memory region of {{domxref("ReadableStreamBYOBRequest.view")}}.
    For example, it is not the same buffer (or a transferred version), has a different `byteOffset`, or is larger than the memory available to the backing view.

