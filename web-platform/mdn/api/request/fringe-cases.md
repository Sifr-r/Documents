# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The request body functions can be run only once; subsequent calls will reject with TypeError showing that the body stream has already used.

> [!NOTE]
> The body can only be a {{domxref("Blob")}}, an {{jsxref("ArrayBuffer")}}, a {{jsxref("TypedArray")}}, a {{jsxref("DataView")}}, a {{domxref("FormData")}}, a {{domxref("URLSearchParams")}}, a {{domxref("ReadableStream")}}, or a {{jsxref("String")}} object, as well as a string literal, so for adding a JSON object to the payload you need to stringify that object.

