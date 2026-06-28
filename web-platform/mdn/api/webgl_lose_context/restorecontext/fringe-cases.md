# Fringe Cases

## Exceptions

Browsers may not report WebGL errors by default. WebGL's error reporting works by calling {{domxref("WEBGLRenderingContext.getError", "getError()")}} and checking for errors. The following exceptions may be thrown:

- `INVALID_OPERATION`
  - : Thrown if the context was not lost.

