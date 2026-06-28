# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When using {{domxref("WebGL2RenderingContext", "WebGL2")}}, this method is available as {{domxref("WebGL2RenderingContext.drawElementsInstanced()", "gl.drawElementsInstanced()")}} by default.

## Exceptions

- If `mode` is not one of the accepted values, a `gl.INVALID_ENUM` error is thrown.
- If `offset` is an invalid multiple of the size of the given type, a `gl.INVALID_OPERATION` error is thrown.
- If `count` or `primcount` are negative, a `gl.INVALID_VALUE` error is thrown.

