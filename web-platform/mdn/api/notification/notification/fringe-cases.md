# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This constructor throws a {{jsxref("TypeError")}} when called in nearly all mobile browsers.
> Instead, you need to register a service worker and use {{domxref("ServiceWorkerRegistration.showNotification()")}}.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if:
    - The constructor is called within the {{domxref("ServiceWorkerGlobalScope")}}.
    - The `actions` option is specified and is not empty.
    - The `silent` option is `true` and the `vibrate` option is specified.
    - The `renotify` option is `true` but the `tag` option is empty.
- `DataCloneError` {{domxref("DOMException")}}
  - : Thrown if serializing the `data` option failed for some reason.

