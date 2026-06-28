# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When using {{domxref("WebGLRenderingContext", "WebGL 1", "", 1)}}, the {{domxref("ANGLE_instanced_arrays")}} extension can provide this method,
> too.

## Exceptions

- If `mode` is not one of the accepted values, a
  `gl.INVALID_ENUM` error is thrown.
- If `offset` is a valid multiple of the size of the given type, a
  `gl.INVALID_OPERATION` error is thrown.
- If `count` or `instanceCount` are negative, a
  `gl.INVALID_VALUE` error is thrown.

