# Fringe Cases

## Exceptions

- `OperationError` {{domxref("DOMException")}}
  - : The method throws an `OperationError` if the following criteria are not met:
    - The size of `data` is equal to or greater than 0.
    - `dataOffset` is equal to or smaller than the size of `data`.
    - The size of `data` (when converted to bytes, in the case of `TypedArray`s) is a multiple of 4.

