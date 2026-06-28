# Fringe Cases

## Exceptions

The returned promise rejects with the following exceptions:

- `NotAllowedError` {{domxref("DOMException")}}
  - : The permission state is `"prompt"` and the calling function does not have {{Glossary("transient activation")}}.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element in order for this feature to work.

