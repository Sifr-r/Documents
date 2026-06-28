# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Temporal.Instant()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown if `epochNanoseconds` represents an instant outside the range of representable instants, which is ±10<sup>8</sup> days, or about ±273,972.6 years, from the Unix epoch.

