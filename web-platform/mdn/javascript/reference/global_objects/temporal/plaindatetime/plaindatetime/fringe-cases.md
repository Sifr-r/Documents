# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Temporal.PlainDateTime()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown in one of the following cases:
    - Any date-time component is not a finite number.
    - The date-time component combination does not represent a valid date in the ISO calendar system, or is not in the [representable range](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), which is ±(10<sup>8</sup> + 1) days, or about ±273,972.6 years, from the Unix epoch.
    - `calendar` is not a valid calendar identifier.

