# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The "challenge" must be a buffer of random information at least 16 bytes in size.

   > [!NOTE]
   > The format for sharing information between the relying party server and the web app is up to the application.
   > A recommended approach is to exchange {{glossary("JSON type representation")}} objects for credentials and credential options.
   > Convenience methods have been created in `PublicKeyCredential` for converting from the JSON representations to the form required by the authentication APIs: {{domxref("PublicKeyCredential.parseCreationOptionsFromJSON_static", "parseCreationOptionsFromJSON()")}}, {{domxref("PublicKeyCredential.parseRequestOptionsFromJSON_static", "parseRequestOptionsFromJSON()")}} and {{domxref("PublicKeyCredential.toJSON()")}}.

> [!WARNING]
> Attestation provides a way for a relying party to determine the provenance of an authenticator. Relying parties should not attempt to maintain allowlists of authenticators.

> [!NOTE]
> Note that by definition, [passkeys](/en-US/docs/Web/Security/Authentication/Passkeys) must always be discoverable credentials.

> [!NOTE]
> Note that only [discoverable credentials](#discoverable_and_non-discoverable_credentials) are included in calls that use conditional mediation, because the browser needs to request applicable credentials without knowing the credential ID values for them.

> [!NOTE]
> Where a policy forbids use of these methods, the {{jsxref("Promise", "promises", "", 1)}} returned by them will reject with a `NotAllowedError` {{domxref("DOMException")}}.

> [!NOTE]
> For security reasons, the Web Authentication API calls ({{domxref("CredentialsContainer.create", "create()")}} and {{domxref("CredentialsContainer.get","get()")}}) are canceled if the browser window loses focus while the call is pending.

