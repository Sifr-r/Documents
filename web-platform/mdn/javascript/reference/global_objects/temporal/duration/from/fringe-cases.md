# Fringe Cases

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - Any of the recognized properties in the `info` object is not an integer (including non-finite values).
    - A [calendar unit](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (years, months, weeks) has an absolute value ≥ 2<sup>32</sup>.
    - The non-calendar part of the duration (days and below), when expressed in seconds, has an absolute value ≥ 2<sup>53</sup>.
- {{jsxref("TypeError")}}
  - : Thrown in one of the following cases:
    - `info` is not an object or a string.
    - All of the recognized properties in the `info` object are `undefined`.

