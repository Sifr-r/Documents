# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the associated `XMLHttpRequest` is not in an opened state, or {{domxref("XMLHttpRequest.send", "send()")}} has already been called on it.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if use of [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API) operations is specifically disallowed by a {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}} or {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- {{jsxref("TypeError")}}
  - : Thrown if the `operation` is set to `send-redemption-record`, and the `issues` array was empty or not set, or one or more of the specified `issuers` are not trustworthy, HTTPS URLs.

