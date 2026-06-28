# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the cache does not exist, the browser defaults to using the network so that the requested resources can still be obtained provided the network is available.

## Exceptions

- `TypeError` {{domxref("DOMException")}}
  - : Thrown if one or more of the rules objects inside `routerRules` is invalid, or has a `source` value of `"fetch-event"` when the associated service worker does not have a {{DOMxRef("ServiceWorkerGlobalScope.fetch_event", "fetch")}} event handler. Also thrown if you try to combine `or` with another condition type.

