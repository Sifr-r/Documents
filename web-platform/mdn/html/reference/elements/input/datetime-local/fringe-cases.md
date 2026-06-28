# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Also bear in mind that if such data is submitted via HTTP [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET), the colon character will need to be escaped for inclusion in the URL parameters, e.g., `party-date=2024-06-01T08%3A30`. See {{jsxref("Global_Objects/encodeURI", "encodeURI()")}} for one way to do this.

> [!NOTE]
> When the data entered by the user doesn't adhere to the stepping configuration, the {{Glossary("user agent")}} may round to the nearest valid value, preferring numbers in the positive direction when there are two equally close options.

> [!WARNING]
> HTML form validation is _not_ a substitute for scripts that ensure that the entered data is in the proper format. It's far too easy for someone to make adjustments to the HTML that allow them to bypass the validation, or to remove it entirely. It's also possible for someone to bypass your HTML entirely and submit the data directly to your server. If your server-side code fails to validate the data it receives, problems can arise when improperly-formatted data is submitted (or data that is too large, is of the wrong type, and so forth).

> [!NOTE]
> With a `datetime-local` input, the date value is always normalized to the format `YYYY-MM-DDTHH:mm`.

> [!NOTE]
> You should be able to use the [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) attribute to vary the number of days jumped each time the date is incremented (e.g., maybe you only want to make Saturdays selectable). However, this does not seem to work effectively in any implementation at the time of writing.

