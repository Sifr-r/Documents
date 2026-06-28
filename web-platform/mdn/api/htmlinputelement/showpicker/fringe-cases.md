# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Pickers for `date`, `datetime-local`, `month`, `time`, `week` are launched in the same way.
> They cannot be shown here because live examples run in a cross-origin frame, and would cause a [`SecurityError`](#securityerror)

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the element is not mutable, meaning that the user cannot modify it and/or that it cannot be automatically prefilled.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if not explicitly triggered by a user action such as a touch gesture or mouse click (the picker requires {{Glossary("Transient activation")}}).
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if called in a cross-origin iframe, except for file and color pickers (exempt for historical reasons).

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element in order for this feature to work.

