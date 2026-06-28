# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This can be used alongside the [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API).
> A controlling service worker could intercept a page's request and redirect it as desired.
> This will actually lead to a real redirect if a service worker sends it upstream.

## Exceptions

- {{jsxref("RangeError")}}
  - : The specified status is not a redirect status.
- {{jsxref("TypeError")}}
  - : The specified URL is invalid.

