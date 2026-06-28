# Fringe Cases

## Exceptions

- A `gl.INVALID_ENUM` error is thrown if
  - `target` is not `gl.FRAMEBUFFER`.
  - `attachment` is not one of the accepted attachment points.

- A `gl.INVALID_VALUE` error is thrown if
  - `level` is not 0.
  - if `numViews` is less than one or more than
    `MAX_VIEWS_OVR`.

- A `gl.INVALID_OPERATION` error is thrown if `texture` isn't 0
  or the name of an existing texture object.

