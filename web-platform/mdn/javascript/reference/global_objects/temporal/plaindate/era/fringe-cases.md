# Fringe Cases

## Warnings & Notes

> [!WARNING]
  > As of October 2025, in the `japanese` calendar, dates prior to 1868-10-23 ISO (the start date of the year 1 Meiji) don't work as expected in browsers in two ways. First, [CLDR had the wrong start date for the Meiji era](https://unicode-org.atlassian.net/browse/CLDR-11375), which causes calendar implementations to extend the Meiji era further to the past than it actually did. Second, the upcoming [Intl era and monthCode Proposal](https://tc39.es/proposal-intl-era-monthcode/) specifies that dates prior to 1873-01-01 ISO should use Gregorian eras, but browsers have traditionally used approximations of prior Japanese eras instead. The `japanese` calendar was taken into use on January 1, 6 Meiji / 1873-01-01 ISO, so these problems only affect proleptic dates.

> [!NOTE]
> This string is not intended for display to users. Use {{jsxref("Temporal/PlainDate/toLocaleString", "toLocaleString()")}} with the appropriate options to get a localized string.

