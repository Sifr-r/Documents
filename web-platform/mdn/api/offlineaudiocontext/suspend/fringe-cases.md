# Fringe Cases

## Exceptions

The promise is rejected when any exception is encountered.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the quantized frame number is one of the following:
    - a negative number
    - less than or equal to the current time
    - greater than or equal to the total render duration
    - scheduled by another suspend for the same time

