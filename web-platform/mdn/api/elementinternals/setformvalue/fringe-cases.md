# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In general, `state` is used to pass information specified by a user, the `value` is suitable for submission to a server, post sanitization.
> For example, if a custom element asked a user to submit a date, the user might enter "3/15/2019".
> This would be the `state`.
> The server expects a date format of `2019-03-15`, the date in this format would be passed as the `value`.

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the element does not have its `formAssociated` property set to `true`.

