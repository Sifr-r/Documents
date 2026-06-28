# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The value of `performance.timeOrigin` may differ from the value returned by {{jsxref("Date.now()")}} executed at the time origin, because `Date.now()` may have been impacted by system and user clock adjustments, clock skew, etc. The `timeOrigin` property is a [monotonic clock](https://w3c.github.io/hr-time/#dfn-monotonic-clock) which current time never decreases and which isn't subject to these adjustments.

