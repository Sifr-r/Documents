# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `{{HTMLElement("input/email", "email")}}` input type requires, at minimum, a match of `x@y` and the `{{HTMLElement("input/url", "url")}}` type requires, at minimum, a match to x:, with no pattern attribute present. When invalid, the {{domxref('validityState.typeMismatch')}} will be true, if there is no pattern attribute (or if the pattern attribute is not valid for that input type).

