# Fringe Cases

## Exceptions

- A `gl.INVALID_ENUM` error is thrown if
  - `target` is not `gl.FRAMEBUFFER`.
  - `attachment` is not one of the accepted attachment points.
  - `textarget` is not one of the accepted texture targets.

- A `gl.INVALID_VALUE` error is thrown if `level` is not 0.
- A `gl.INVALID_OPERATION` error is thrown if `texture` isn't 0
  or the name of an existing texture object.

