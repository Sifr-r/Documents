# Fringe Cases

## Exceptions

Only one target can be bound to a given {{domxref("WebGLBuffer")}}. An attempt to bind
the buffer to another target will throw an `INVALID_OPERATION` error and the
current buffer binding will remain the same.

A {{domxref("WebGLBuffer")}} which has been marked for deletion with
{{domxref("WebGLRenderingContext.deleteBuffer()", "deleteBuffer")}} cannot be
(re-)bound. An attempt to do so will generate an `INVALID_OPERATION` error,
and the current binding will remain untouched.

