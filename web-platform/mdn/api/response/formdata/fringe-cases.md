# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This is mainly relevant to [service workers](/en-US/docs/Web/API/Service_Worker_API). If a user submits
> a form and a service worker intercepts the request, you could for example call
> `formData()` on it to obtain a key-value map, modify some fields, then send
> the form onwards to the server (or use it locally).

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : The request was [aborted](/en-US/docs/Web/API/Fetch_API/Using_Fetch#canceling_a_request).
- {{jsxref("TypeError")}}
  - : Thrown for one of the following reasons:
    - The response body is [disturbed or locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - There was an error decoding the body content (for example, because the {{httpheader("Content-Encoding")}} header is incorrect).
    - The {{glossary("MIME")}} type of the body cannot be determined from the {{httpheader("Content-Type")}} headers included in the response, or is not `application/x-www-form-urlencoded` or `multipart/form-data`.
    - The body cannot be parsed as a `FormData` object.

