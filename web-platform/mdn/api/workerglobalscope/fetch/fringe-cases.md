# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `fetch()` method's parameters are identical to those of the {{domxref("Request.Request","Request()")}} constructor.

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : The request was aborted due to a call to the {{domxref("AbortController")}} {{domxref("AbortController.abort", "abort()")}} method.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if use of the [Topics API](/en-US/docs/Web/API/Topics_API) is specifically disallowed by a {{httpheader('Permissions-Policy/browsing-topics','browsing-topics')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), and a `fetch()` request was made with `browsingTopics: true`.
- {{jsxref("TypeError")}}
  - : An error when the fetch operation could not be performed.
    See {{domxref("Window.fetch()")}} exceptions for a list of reasons why this error can occur.

