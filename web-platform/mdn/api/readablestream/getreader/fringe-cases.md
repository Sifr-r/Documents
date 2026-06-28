# Fringe Cases

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown if the provided mode value is not `"byob"` or `undefined`.
- {{jsxref("TypeError")}}
  - : Thrown if the stream you are trying to create a reader for is already locked, or not a {{domxref("ReadableStream")}}.
    This is also thrown if a BYOB reader is requested and the stream controller is not a {{domxref("ReadableByteStreamController")}} (the stream was not [constructed](/en-US/docs/Web/API/ReadableStream/ReadableStream) as an underlying source with [`type="bytes"`](/en-US/docs/Web/API/ReadableStream/ReadableStream#type)).

