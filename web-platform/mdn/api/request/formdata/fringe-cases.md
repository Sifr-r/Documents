# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown for one of the following reasons:
    - The request body is [disturbed or locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - There was an error decoding the body content (for example, because the {{httpheader("Content-Encoding")}} header is incorrect).
    - The {{glossary("MIME")}} type of the body cannot be determined from the {{httpheader("Content-Type")}} headers included in the request, or is not `application/x-www-form-urlencoded` or `multipart/form-data`.
    - The body cannot be parsed as a `FormData` object.

