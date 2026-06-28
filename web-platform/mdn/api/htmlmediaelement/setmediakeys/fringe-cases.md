# Fringe Cases

## Exceptions

The returned promise may reject an error:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Media keys are already in the process of being attached, or the previous keys cannot be removed at the current time (for example, because the particular implementation does not allow removal during playback).
- {{domxref("QuotaExceededError")}}
  - : The passed keys are already in use by another element, or the browser is unable to use it with this element for other reasons.
- `NotSupportedError` {{domxref("DOMException")}}
  - : The media keys that are currently associated with the media cannot be disassociated, because this is not supported by either the CDM or the browser.

