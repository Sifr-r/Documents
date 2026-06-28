# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the element is not mutable, meaning that the user cannot modify it and/or that it cannot be automatically prefilled.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if not explicitly triggered by a user action such as a touch gesture or mouse click (the picker requires {{Glossary("Transient activation")}}).
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the element associated with the picker is not being rendered.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if called in a cross-origin iframe.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required.
The user has to interact with the page or a UI element in order for this feature to work.

The method is only allowed to be called in same-origin iframes; an exception is thrown if this is called in a cross-origin iframe.

