# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if:
    - The current service worker's state is not `activating` or `activated`.
    - The user has explicitly denied the browser's permission request to use the API.
    - The `silent` option is `true` and the `vibrate` option is specified.
    - The `renotify` option is `true` but the `tag` option is empty.
- `DataCloneError` {{domxref("DOMException")}}
  - : Thrown if serializing the `data` option failed for some reason.

