# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Private state tokens are not a replacement for CAPTCHAs or other trust-establishing mechanisms. Private state tokens provide a way to _convey_ trust in a user, not _establish_ trust in a user.

## Security Notes

Private state token `token-request` operations are controlled by the {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}} {{httpheader("Permissions-Policy")}} directive, whereas `token-redemption` and `send-redemption-record` operations are controlled by the {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}} directive.

Specifically, where a defined policy blocks usage, any attempts to initiate private state token operations via fetch requests will fail.

