# Fringe Cases

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Thrown if the `LanguageDetector` was previously destroyed (had {{domxref("LanguageDetector.destroy()")}} called on it, or was aborted via its abort [`signal`](/en-US/docs/Web/API/LanguageDetector/create_static#signal) after creation).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the current {{domxref("Document")}} is not active.
- {{domxref("QuotaExceededError")}}
  - : Thrown if the language detection operation exceeds the available {{domxref("LanguageDetector.inputQuota", "inputQuota")}}.

