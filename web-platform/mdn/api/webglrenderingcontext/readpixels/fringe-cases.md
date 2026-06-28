# Fringe Cases

## Exceptions

- A `gl.INVALID_ENUM` error is thrown if `format` or
  `type` is not an accepted value.
- A `gl.INVALID_OPERATION` error is thrown if
  - `type` is `gl.UNSIGNED_SHORT_5_6_5` and
    `format` is not `gl.RGB`.
  - `type` is `gl.UNSIGNED_SHORT_4_4_4_4` and
    `format` is not `gl.RGBA`.
  - `type` does not match the typed array type of `pixels`.

- A `gl.INVALID_FRAMEBUFFER_OPERATION` error is thrown if the currently
  bound framebuffer is not framebuffer complete.

