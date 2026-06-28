# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `BackgroundFetchRegistration.match()` is basically identical to
> {{domxref("BackgroundFetchRegistration.matchAll()")}}, except that rather than resolving with an array of
> all matching records, it resolves with the first matching record only.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if you call `match()` when there are no fetches in progress. This state will be reflected by {{domxref("BackgroundFetchRegistration.recordsAvailable")}} being set to `false`.

