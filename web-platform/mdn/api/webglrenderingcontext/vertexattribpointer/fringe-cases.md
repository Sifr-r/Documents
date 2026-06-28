# Fringe Cases

## Exceptions

- A `gl.INVALID_VALUE` error is thrown if `stride` or `offset` are negative.
- A `gl.INVALID_OPERATION` error is thrown if `stride` and
  `offset` are not multiples of the size of the data type.
- A `gl.INVALID_OPERATION` error is thrown if no WebGLBuffer is bound to
  the ARRAY_BUFFER target.
- When using a {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, a
  `gl.INVALID_OPERATION` error is thrown if this vertex attribute is defined
  as an integer in the vertex shader (e.g., `uvec4` or `ivec4`,
  instead of `vec4`).

