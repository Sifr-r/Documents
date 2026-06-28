# Fringe Cases

## Warnings & Notes

> [!NOTE]
> [Typed arrays](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray) like {{jsxref("Int32Array")}} and {{jsxref("Uint8Array")}}, are {{Glossary("serializable object","serializable")}}, but not transferable.
> However their underlying buffer is an {{jsxref("ArrayBuffer")}}, which is a transferable object.
> We could have sent `uInt8Array.buffer` in the data parameter, but not `uInt8Array` in the transfer array.

> [!NOTE]
> Transferable objects are marked up in [Web IDL files](https://github.com/w3c/webref/tree/main/ed/idl) with the attribute `[Transferable]`.
> Browser support may be indicated in the respective object's compatibility information by the `transferable` subfeature (see [`RTCDataChannel`](/en-US/docs/Web/API/RTCDataChannel#browser_compatibility) for an example).

