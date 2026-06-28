# Fringe Cases

## Exceptions

An `INVALID_VALUE` error is generated if:

- `offset` + `returnedData.byteLength` would extend beyond the
  end of the buffer
- `returnedData` is [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)
- `offset` is less than zero.

An `INVALID_OPERATION` error is generated if:

- zero is bound to `target`
- `target` is `TRANSFORM_FEEDBACK_BUFFER`, and any transform
  feedback object is currently active.

