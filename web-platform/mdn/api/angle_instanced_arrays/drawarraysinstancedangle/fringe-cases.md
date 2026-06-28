# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When using {{domxref("WebGL2RenderingContext", "WebGL2")}}, this method is available as {{domxref("WebGL2RenderingContext.drawArraysInstanced()", "gl.drawArraysInstanced()")}} by default.

## Exceptions

- If `mode` is not one of the accepted values, a `gl.INVALID_ENUM` error is thrown.
- If `first`, `count` or `primcount` are negative, a `gl.INVALID_VALUE` error is thrown.
- if `gl.CURRENT_PROGRAM` is [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), a `gl.INVALID_OPERATION` error is thrown.

