# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : This exception is thrown in the following conditions:
    - The service worker's registration is not present or the service worker does not contain a {{domxref('FetchEvent')}}.
    - One of `id`, `title`, `description` or `url` parameter are missing, not of type {{jsxref('String')}}, or an empty {{jsxref('String')}}.
    - The `url` parameter is not {{glossary("same-origin policy")}} with the {{domxref("ServiceWorker", "service worker", "", "nocode")}}.
    - One of the items in `icons` are not an image type, or fetching one of the items in `icons` failed with a network error or decode error.

