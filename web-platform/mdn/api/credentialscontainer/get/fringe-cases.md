# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > In the case of a [federated authentication (FedCM API)](/en-US/docs/Web/API/FedCM_API) request, a `mediation` value of `optional` or `silent` may result in attempted [auto-reauthentication](/en-US/docs/Web/API/FedCM_API/RP_sign-in#auto-reauthentication). Whether this occurred is communicated to the identity provider (IdP) via the [`is_auto_selected`](/en-US/docs/Web/API/FedCM_API/IDP_integration#is_auto_selected) parameter sent to the IdP's `id_assertion_endpoint` during validation and the relying party (RP) via the {{domxref("IdentityCredential.isAutoSelected")}} property. This is useful for performance evaluation, security requirements (the IdP may wish to reject automatic reauthentication requests and always require user mediation), and general UX (an IdP or RP may wish to present different UX for auto and non-auto login experiences).

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : The request was aborted by a call to the {{domxref("AbortController.abort", "abort()")}} method of the {{domxref("AbortController")}} associated with this method's [`signal`](#signal) option.
    Note that if the caller of `abort()` provided a `reason` argument, then `get()` will be rejected with the value of `reason`, instead of an `AbortController` exception.

- `TimeoutError` {{domxref("DOMException")}}
  - : The request was automatically aborted due to a timeout set using {{domxref("AbortSignal.timeout_static", "AbortSignal.timeout()")}}.

- {{domxref("IdentityCredentialError")}}
  - : When requesting an {{domxref("IdentityCredential")}}, the request to the [ID assertion endpoint](/en-US/docs/Web/API/FedCM_API/IDP_integration#the_id_assertion_endpoint) is unable to validate the authentication, and rejects with an error response containing information about the reason.

- `NetworkError` {{domxref("DOMException")}}
  - : When requesting an {{domxref("IdentityCredential")}}, the {{glossary("identity provider")}} (IdP) did not respond within 60 seconds, the provided credentials were not valid/found, or the browser's login status for the IdP is set to `"logged-out"` (see [Update login status using the Login Status API](/en-US/docs/Web/API/FedCM_API/IDP_integration#update_login_status_using_the_login_status_api) for more information about FedCM login status). In the latter case, there may be some delay in the rejection to avoid leaking the IdP login status to the RP.

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown in one of the following situations:
    - The user canceled the request.

    - Use of this API was blocked by one of the following [permissions policies](/en-US/docs/Web/HTTP/Guides/Permissions_Policy):
      - {{HTTPHeader("Permissions-Policy/identity-credentials-get","identity-credentials-get")}}
      - {{HTTPHeader("Permissions-Policy/publickey-credentials-get","publickey-credentials-get")}}
      - {{HTTPHeader("Permissions-Policy/otp-credentials","otp-credentials")}}

    - The calling origin is an [opaque origin](/en-US/docs/Web/HTTP/Reference/Headers/Origin#null).

- `SecurityError` {{domxref("DOMException")}}
  - : The calling domain is not a valid domain.

