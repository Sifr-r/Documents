# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Temporal.PlainYearMonth()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

> [!WARNING]
> Avoid using the `calendar` and `referenceDay` parameters, because {{jsxref("Temporal/PlainYearMonth/equals", "equals()")}} and {{jsxref("Temporal/PlainYearMonth/compare", "compare()")}} will consider the reference day for comparison, causing two equivalent year-months to be considered different if they have different reference days. To create a `Temporal.PlainYearMonth` object with a non-ISO calendar, use the {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}} static method.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `calendar` is not a string or `undefined`.
- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - `year`, `month`, or `referenceDay` is not a finite number.
    - The `year`, `month`, and `referenceDay` combination does not represent a valid date in the ISO calendar system, or is not in the [representable range](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), which is ±(10<sup>8</sup> + 1) days, or about ±273,972.6 years, from the Unix epoch.
    - `calendar` is not a valid calendar identifier.

