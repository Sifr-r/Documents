# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Temporal.PlainDate()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `calendar` is not a string or `undefined`.
- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - `year`, `month`, or `day` is not a finite number.
    - The `year`, `month`, and `day` combination does not represent a valid date in the ISO calendar system, or is not in the [representable range](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), which is ±(10<sup>8</sup> + 1) days, or about ±273,972.6 years, from the Unix epoch.
    - `calendar` is not a valid calendar identifier.

