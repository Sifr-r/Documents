# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `PlainYearMonth` objects keep track of a reference ISO day, which is also used in the comparison. This day is automatically set when using the {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}} method, but can be set manually using the {{jsxref("Temporal/PlainYearMonth/PlainYearMonth", "Temporal.PlainYearMonth()")}} constructor, causing two equivalent year-months to be considered different if they have different reference days. For this reason, you should avoid using the constructor directly and prefer the `from()` method.

