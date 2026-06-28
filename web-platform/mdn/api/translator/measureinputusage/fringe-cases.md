# Fringe Cases

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if usage of the `Translator` API is blocked by a {{httpheader('Permissions-Policy/translator','translator')}} {{httpheader("Permissions-Policy")}}.
- `NotReadableError` {{domxref("DOMException")}}
  - : Thrown if the output translation was filtered by the user agent, for example because it was detected to be harmful, inaccurate, or nonsensical.
- `UnknownError` {{domxref("DOMException")}}
  - : Thrown if the `measureInputUsage()` call failed for any other reason, or a reason the user agent did not wish to disclose.

