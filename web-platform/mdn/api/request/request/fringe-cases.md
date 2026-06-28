# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This last usage is probably only useful in [ServiceWorkers](/en-US/docs/Web/API/Service_Worker_API).

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if:
    - Use of the [Topics API](/en-US/docs/Web/API/Topics_API) is specifically disallowed by a {{httpheader('Permissions-Policy/browsing-topics','browsing-topics')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), and `browsingTopics` is set to `true`.
    - Use of [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API) operations is specifically disallowed by a {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}} or {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), and the `privateToken` option is specified, including a disallowed `privateToken.operation` type.
- `TypeError`
  - : Thrown if:
    - The URL has credentials, such as `http://user:password@example.com`, or cannot be parsed.
    - The `privateToken` init option is specified, including a `privateToken.operation` type of `send-redemption-record`, and the `privateToken.issues` array was empty or not set, or one or more of the specified `issuers` are not trustworthy, HTTPS URLs.

