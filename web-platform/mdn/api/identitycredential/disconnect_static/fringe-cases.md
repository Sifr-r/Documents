# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if:
    - The IdP's `configURL` is invalid or missing the `disconnect_endpoint`.
    - The document's origin does not match the `configURL`.
- `NetworkError` {{domxref("DOMException")}}
  - : Thrown if:
    - The browser is unable to connect to the IdP.
    - The request is disallowed by a [`connect-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/connect-src) {{httpheader("Content-Security-Policy")}}.
    - Another `disconnect()` call was previously made that has not yet resolved.
    - The FedCM API has been disabled globally.
    - The IdP's `configURL` is neither secure nor [potentially trustworthy](/en-US/docs/Web/Security/Defenses/Secure_Contexts#potentially_trustworthy_origins).
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the embedding `<iframe>` does not have an {{httpheader("Permissions-Policy/identity-credentials-get", "identity-credentials-get")}} [Permissions-Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) set to allow the use of `disconnect()` or if the FedCM API is disabled globally by a policy set on the top-level document.

