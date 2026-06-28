# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `info` is not a `Temporal.Instant` instance or a string.
- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - The string is not a valid RFC 9557 string.
    - The info is not in the [representable range](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), which is ±10<sup>8</sup> days, or about ±273,972.6 years, from the Unix epoch.

