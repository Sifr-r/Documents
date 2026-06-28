# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if this `ArrayBuffer` is already detached, or if it can only be detached by designated operations. Currently, only certain web APIs are capable of creating `ArrayBuffer` objects with designated detaching methods, such as {{domxref("GPUBuffer.getMappedRange()")}} and [`WebAssembly.Memory.buffer`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/buffer).

