# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When setting `responseType` to a particular value, the author should make
> sure that the server is actually sending a response compatible with that format. If
> the server returns data that is not compatible with the `responseType` that
> was set, the value of {{domxref("XMLHttpRequest.response", "response")}} will be
> `null`.

## Exceptions

- `InvalidAccessError` {{domxref("DOMException")}}
  - : An attempt was made to change the value of `responseType` on
    an `XMLHttpRequest` which is in synchronous mode but not in a
    {{domxref("Worker")}}. For additional details, see [Synchronous XHR restrictions](#synchronous_xhr_restrictions) below.

