# Fringe Cases

## Warnings & Notes

> [!NOTE]
> With the introduction of the {{jsxref("Temporal")}} API, the `Date` object is considered a legacy feature. Consider using `Temporal` for new code and migrate existing code over to it if possible (check the [browser compatibility](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#browser_compatibility). We will be writing a usage guide soon!

> [!NOTE]
> While the time value at the heart of a Date object is UTC, the basic methods to fetch the date and time or its components all work in the local (i.e., host system) time zone and offset.

> [!NOTE]
> UTC should not be confused with the [Greenwich Mean Time](https://en.wikipedia.org/wiki/Greenwich_Mean_Time) (GMT), because they are not always equal — this is explained in more detail in the linked Wikipedia page.

> [!NOTE]
> Some methods, including the `Date()` constructor, `Date.UTC()`, and the deprecated {{jsxref("Date/getYear", "getYear()")}}/{{jsxref("Date/setYear", "setYear()")}} methods, interpret a two-digit year as a year in the 1900s. For example, `new Date(99, 5, 24)` is interpreted as June 24, 1999, not June 24, 99. See [Interpretation of two-digit years](#interpretation_of_two-digit_years) for more information.

> [!NOTE]
> You are encouraged to make sure your input conforms to the date time string format above for maximum compatibility, because support for other formats is not guaranteed. However, there are some formats that are supported in all major implementations — like {{rfc(2822)}} format — in which case their usage can be acceptable. Always conduct [cross-browser tests](/en-US/docs/Learn_web_development/Extensions/Testing) to ensure your code works in all target browsers. A library can help if many different formats are to be accommodated.

> [!NOTE]
> Creating a date from a string has a lot of behavior inconsistencies. See [date time string format](#date_time_string_format) for caveats on using different formats.

> [!NOTE]
> In browsers that support the {{domxref("Performance API", "", "", "nocode")}}'s high-resolution time feature, {{domxref("Performance.now()")}} can provide more reliable and precise measurements of elapsed time than {{jsxref("Date.now()")}}.

