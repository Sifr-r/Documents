# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > If `mode` is `POINTS`, [`gl_PointSize`](https://registry.khronos.org/OpenGL-Refpages/gl4/html/gl_PointSize.xhtml) may need to be set for `drawArrays` to render, as its value is unknown if not explicitly written. Only some GPUs set its default as `1.0`.

## Exceptions

- If `mode` is not one of the accepted values, a
  `gl.INVALID_ENUM` error is thrown.
- If `first` or `count` are negative, a
  `gl.INVALID_VALUE` error is thrown.
- if `gl.CURRENT_PROGRAM` is [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), a
  `gl.INVALID_OPERATION` error is thrown.

