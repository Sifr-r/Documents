# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the provided `configURL` is invalid or if the embedded document's origin does not match the `configURL`.
- `NetworkError` {{domxref("DOMException")}}
  - : Thrown if the browser is unable to connect to the IdP or if `getUserInfo()` is invoked from the top-level document.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the embedding `<iframe>` does not have an {{httpheader("Permissions-Policy/identity-credentials-get", "identity-credentials-get")}} [Permissions-Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) set to allow the use of `getUserInfo()` or if the FedCM API is disabled globally by a policy set on the top-level document.

