# Fringe Cases

## Exceptions

- If `buf` is not a valid value, a `gl.INVALID_VALUE` error is thrown.
- If `src` or `dst` are not one of the possible values, a `gl.INVALID_ENUM` error is thrown.
- The same blending limitations as for {{DOMxRef("WebGLRenderingContext.blendFunc()")}} apply: If a constant color and a constant alpha value are used together as source and destination factors, a `gl.INVALID_ENUM` error is thrown.

