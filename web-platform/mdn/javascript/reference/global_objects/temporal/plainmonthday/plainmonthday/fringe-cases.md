# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Temporal.PlainMonthDay()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

> [!WARNING]
> Avoid using the `calendar` and `referenceYear` parameters, because {{jsxref("Temporal/PlainMonthDay/equals", "equals()")}} will consider the reference year for equality, causing two equivalent month-days to be considered different if they have different reference years. To create a `Temporal.PlainMonthDay` object with a non-ISO calendar, use the {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}} static method.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `calendar` is not a string or `undefined`.
- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - `referenceYear`, `month`, or `day` is not a finite number.
    - The `referenceYear`, `month`, and `day` combination does not represent a valid date in the ISO calendar system, or is not in the [representable range](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), which is ±(10<sup>8</sup> + 1) days, or about ±273,972.6 years, from the Unix epoch.
    - `calendar` is not a valid calendar identifier.

