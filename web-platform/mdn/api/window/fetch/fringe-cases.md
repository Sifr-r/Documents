# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `fetch()` method's parameters are identical to those of the {{domxref("Request.Request","Request()")}} constructor.

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : The request was aborted due to a call to the {{domxref("AbortController")}}
    {{domxref("AbortController.abort", "abort()")}} method.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if:
    - Use of the [Topics API](/en-US/docs/Web/API/Topics_API) is specifically disallowed by a {{httpheader('Permissions-Policy/browsing-topics','browsing-topics')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), and `browsingTopics` is set to `true`.
    - Use of [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API) operations is specifically disallowed by a {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}} or {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), and the `privateToken` option is specified, including a disallowed `privateToken.operation` type.
- {{jsxref("TypeError")}}
  - : Can occur for the following reasons:
    - The requested URL is invalid.
    - The requested URL includes credentials (username and password).
    - The {{domxref("RequestInit")}} object passed as the value of `options` included properties with invalid values.
    - The request is blocked by a permissions policy.
    - There is a network error (for example, because the device does not have connectivity).
    - The `privateToken` init option is specified, including a `privateToken.operation` type of `send-redemption-record`, and the `privateToken.issues` array was empty or not set, or one or more of the specified `issuers` are not trustworthy, HTTPS URLs.

