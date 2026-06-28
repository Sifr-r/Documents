# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `PlainMonthDay` objects keep track of a reference ISO year, which is also used in the comparison. This year is automatically set when using the {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}} method, but can be set manually using the {{jsxref("Temporal/PlainMonthDay/PlainMonthDay", "Temporal.PlainMonthDay()")}} constructor, causing two equivalent month-days to be considered different if they have different reference years. For this reason, you should avoid using the constructor directly and prefer the `from()` method.

