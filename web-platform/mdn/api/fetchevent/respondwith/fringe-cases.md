# Fringe Cases

## Warnings & Notes

> [!NOTE]
> {{domxref("CacheStorage.match()", "caches.match()")}} is a
> convenience method. Equivalent functionality is to call
> {{domxref("cache.match()")}} on each cache (in the order returned by
> {{domxref("CacheStorage.keys()", "caches.keys()")}}) until a
> {{domxref("Response")}} is returned.

## Exceptions

- `NetworkError` {{domxref("DOMException")}}
  - : Returned if a network error is triggered on certain combinations of
    {{domxref("Request.mode","FetchEvent.request.mode")}} and
    {{domxref("Response.type")}} values, as hinted at in the "global rules"
    listed above.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the event has not been dispatched or `respondWith()` has
    already been invoked.

