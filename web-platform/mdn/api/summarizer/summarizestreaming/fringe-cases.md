# Fringe Cases

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Thrown if the `Summarizer` was previously destroyed (had {{domxref("Summarizer.destroy()")}} called on it, or was aborted via its abort [`signal`](/en-US/docs/Web/API/Summarizer/create_static#signal) after creation).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the current {{domxref("Document")}} is not active.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if usage of the Summarizer API is blocked by a {{httpheader('Permissions-Policy/summarizer','summarizer')}} {{httpheader("Permissions-Policy")}}.
- `NotReadableError` {{domxref("DOMException")}}
  - : Thrown if the output summary was filtered by the user agent, for example because it was detected to be harmful, inaccurate, or nonsensical.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the provided `context` is not in language the `Summarizer` supports.
- {{domxref("QuotaExceededError")}}
  - : Thrown if the summarize operation exceeds the available {{domxref("Summarizer.inputQuota", "inputQuota")}}.
- `UnknownError` {{domxref("DOMException")}}
  - : Thrown if the `summarizeStreaming()` call failed for any other reason, or a reason the user agent did not wish to disclose.

