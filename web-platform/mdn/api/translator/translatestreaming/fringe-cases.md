# Fringe Cases

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Thrown if the `Translator` was previously destroyed (had {{domxref("Translator.destroy()")}} called on it, or was aborted via its abort [`signal`](/en-US/docs/Web/API/Translator/create_static#signal) after creation).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the current {{domxref("Document")}} is not active.
- {{domxref("QuotaExceededError")}}
  - : Thrown if the translation operation exceeds the available {{domxref("Translator.inputQuota", "inputQuota")}}.

