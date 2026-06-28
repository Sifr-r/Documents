# Fringe Cases

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Thrown if the user dismisses the file picker without selecting or inputting a file,
    or if the user agent deems any selected files too sensitive or dangerous.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the call was blocked by the [same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy) or it was not called via a user interaction such as a button press.
- {{jsxref("TypeError")}}
  - : Thrown if accept types can't be processed, which may happen if:
    - Any key string of the `accept` options of any item in `types` options can't parse a valid MIME type.
    - Any value string(s) of the `accept` options of any item in `types` options is invalid, for example, if it does not start with `.` and if end with `.`, or if it contains any invalid code points and its length is more than 16.
    - The `types` options is empty and the `excludeAcceptAllOption` options is `true`.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element in order for this feature to work.

