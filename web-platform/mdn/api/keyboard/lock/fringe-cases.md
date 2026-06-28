# Fringe Cases

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Thrown if a new call to `lock()` is made before the current one has finished.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if any key in `keyCodes` is not a valid [key code attribute value](https://w3c.github.io/uievents-code/#key-code-attribute-value).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if `lock()` is not called in an active top-level browsing context.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element in order for this feature to work.

