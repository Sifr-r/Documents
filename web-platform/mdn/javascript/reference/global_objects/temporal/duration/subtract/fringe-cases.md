# Fringe Cases

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - Either `this` or `other` is a [calendar duration](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (it has a non-zero `years`, `months`, or `weeks`), because calendar durations are ambiguous without a calendar and time reference.
    - The difference of `this` and `other` overflows the maximum or underflows the minimum representable duration, which is ±2<sup>53</sup> seconds.

