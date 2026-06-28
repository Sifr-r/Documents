# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If a different response may result from setting this header, the server must set `Vary: Service-Worker-Navigation-Preload` to ensure that the different responses are cached.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : There is no active worker associated with the registration to which this {{domxref("NavigationPreloadManager")}} belongs.

