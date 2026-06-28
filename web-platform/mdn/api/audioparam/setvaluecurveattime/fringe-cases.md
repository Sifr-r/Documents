# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Some early implementations of the Web Audio API did not ensure
> this to be the case, causing unexpected results.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the specified array of `values` has fewer than 2 items in it.
- {{jsxref("RangeError")}}
  - : Thrown if the specified `startTime` is either negative or a non-finite value, or
    `duration` is not a finite, strictly positive number.
- {{jsxref("TypeError")}}
  - : Thrown if one or more of the values in the `values` array is non-finite. Non-finite
    values are `NaN`, `Infinity`, and `-Infinity`.

