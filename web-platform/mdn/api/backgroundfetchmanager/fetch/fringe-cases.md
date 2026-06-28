# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Raised if no request is provided, if the mode of a request is `no-cors`, if no service worker is present, a request already exists with the requested `id`, or the request fails.
- `AbortError` {{domxref("DOMException")}}
  - : Indicates that the fetch was aborted.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Indicates that user permission has not been granted to make background fetches.
- {{domxref("QuotaExceededError")}}
  - : Thrown if storing requests failed due to exceed the browser's [storage quota](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria).

