# Fringe Cases

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Thrown if the user dismisses the prompt without making a selection,
    or if the user agent deems the selected directory to be too sensitive or dangerous,
    or if the {{domxref('PermissionStatus.state')}} for the selected directory is not `"granted"` in the specified `mode`.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the call was blocked by the [same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy) or it was not called via a user interaction such as a button press.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element in order for this feature to work.

