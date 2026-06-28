# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Usually, the day index only changes when transitioning from one calendar system into another, such as [from the Julian to the Gregorian calendar](https://en.wikipedia.org/wiki/Adoption_of_the_Gregorian_calendar). In practice, all currently built-in calendars are [proleptic](https://en.wikipedia.org/wiki/Proleptic_Gregorian_calendar), meaning the calendar system is extended indefinitely into the past and future. Assuming `day` is non-continuous guards against future introductions of non-proleptic calendars.

> [!NOTE]
> Avoid using {{jsxref("Temporal/PlainDate/daysInMonth", "daysInMonth")}} to set the day to the last day of the month. The last day of the month is not always the same as the number of days in the month, in the rare case where a month may have a few days skipped.

