# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the current {{domxref("Document")}} is not yet active.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if:
    - The current {{domxref("Document")}} is not loaded in a [secure context](/en-US/docs/Glossary/Secure_Context).
    - The maximum number of issuers per top level [origin](/en-US/docs/Glossary/Origin) (two) has been exceeded.
- `TypeError` {{domxref("DOMException")}}
  - : Thrown if `issuer` is not a valid URL.

