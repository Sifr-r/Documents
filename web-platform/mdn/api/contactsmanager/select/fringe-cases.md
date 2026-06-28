# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the browsing context is not top-level, if the contact picker shows a flag that denotes an already existing contact picker since only one picker can exist at any time, or if launching a contact picker failed.
- `SecurityError` {{domxref("DOMException")}}
  - : Returned if the method is not triggered by [user activation](/en-US/docs/Web/Security/Defenses/User_activation).
- {{jsxref("TypeError")}}
  - : Returned if `properties` is empty, or if any of the specified properties are not
    supported.

## Security Notes

{{Glossary("Transient activation")}} is required. The user has to interact with the page or a UI element in order for this feature to work.

