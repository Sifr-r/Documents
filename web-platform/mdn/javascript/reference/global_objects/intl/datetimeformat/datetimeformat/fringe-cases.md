# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Intl.DateTimeFormat()` can be called with or without [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Both create a new `Intl.DateTimeFormat` instance. However, there's a special behavior when it's called without `new` and the `this` value is another `Intl.DateTimeFormat` instance; see [Return value](#return_value).

    > [!NOTE]
    > This option only has an effect if a 12-hour clock (`hourCycle: "h12"` or `hourCycle: "h11"`) is used. Many locales use the same string irrespective of the width specified.

    > [!NOTE]
    > Timezone display may fall back to another format if a required string is unavailable. For example, the non-location formats should display the timezone without a specific country/city location like "Pacific Time", but may fall back to a timezone like "Los Angeles Time".

> [!NOTE]
> `dateStyle` and `timeStyle` can be used with each other, but not with other date-time component options (e.g., `weekday`, `hour`, `month`, etc.).

> [!NOTE]
> The text below describes behavior that is marked by the specification as "optional". It may not work in all environments. Check the [browser compatibility table](#browser_compatibility).

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown if `locales` or `options` contain invalid values.

