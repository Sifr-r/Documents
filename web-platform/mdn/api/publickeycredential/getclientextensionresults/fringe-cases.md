# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `getClientExtensionResults()` only returns the results from extensions processed by the user agent (client). The results from extensions processed by the authenticator can be found in the [authenticator data](/en-US/docs/Web/API/Web_Authentication_API/Authenticator_data) available in {{domxref("AuthenticatorAssertionResponse.authenticatorData")}}.

> [!NOTE]
> Extensions are optional and different browsers may recognize different extensions. Processing extensions is always optional for the client: if a browser does not recognize a given extension, it will just ignore it. For information on which extensions are supported by which browsers, see [Web Authentication extensions](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions).

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : The RP domain is not valid.

