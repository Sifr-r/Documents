# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the {{domxref("Response")}} has a
> {{domxref("Response.type")}} of `"opaque"`, the resulting {{domxref("Blob")}}
> will have a {{domxref("Blob.size")}} of `0` and a {{domxref("Blob.type")}} of
> empty string `""`, which renders it _useless_ for methods like
> {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}.

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : The request was [aborted](/en-US/docs/Web/API/Fetch_API/Using_Fetch#canceling_a_request).
- {{jsxref("TypeError")}}
  - : Thrown for one of the following reasons:
    - The response body is [disturbed or locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - There was an error decoding the body content (for example, because the {{httpheader("Content-Encoding")}} header is incorrect).

