# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Temporal.ZonedDateTime()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `timeZone` or `calendar` is not a string.
- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - `epochNanoseconds` is not in the [representable range](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), which is ±10<sup>8</sup> days, or about ±273,972.6 years, from the Unix epoch.
    - `timeZone` is not a valid time zone identifier.
    - `calendar` is not a valid calendar identifier.

