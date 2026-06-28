# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > Usage of `create()` with the `publicKey` parameter may be blocked by a {{HTTPHeader("Permissions-Policy/publickey-credentials-create","publickey-credentials-create")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) set on your server.

> [!NOTE]
> See [Creating a key pair and registering a user](/en-US/docs/Web/API/Web_Authentication_API#creating_a_key_pair_and_registering_a_user) for more information about how the overall flow works.

## Exceptions

- {{jsxref("TypeError")}}
  - : In the case of a {{domxref("PasswordCredential")}} creation request, `id`, `origin`, or `password` were not provided (empty).
- `NotAllowedError` {{domxref("DOMException")}}
  - : Possible causes include:
    - Usage was blocked by a {{HTTPHeader("Permissions-Policy/publickey-credentials-create","publickey-credentials-create")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
    - The function is called cross-origin but the iframe's [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow) attribute does not set an appropriate {{HTTPHeader("Permissions-Policy/publickey-credentials-create","publickey-credentials-create")}} policy.
    - The function is called cross-origin and the `<iframe>` does not have {{glossary("transient activation")}}.
    - The function tried to create a [discoverable credential](/en-US/docs/Web/API/Web_Authentication_API#discoverable_and_non-discoverable_credentials) ([`residentKey`](/en-US/docs/Web/API/PublicKeyCredentialCreationOptions#residentkey) is set to `required` in the `create()` call's {{domxref("PublicKeyCredentialCreationOptions")}} option), but the user does not have an authenticator that supports discoverable credentials.
- `AbortError` {{domxref("DOMException")}}
  - : The operation was aborted.

