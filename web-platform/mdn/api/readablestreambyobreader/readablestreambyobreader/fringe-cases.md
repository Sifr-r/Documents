# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You generally wouldn't use this constructor manually;
> instead, you'd use the {{domxref("ReadableStream.getReader()")}} method with the argument `"byob"`.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the supplied `stream` parameter is not a {{domxref("ReadableStream")}}, or it is already locked for reading by another reader, or its stream controller is not a {{domxref("ReadableByteStreamController")}}.

