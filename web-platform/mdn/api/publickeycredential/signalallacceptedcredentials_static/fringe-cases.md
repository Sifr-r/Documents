# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Exercise caution when invoking `signalAllAcceptedCredentials()` — any valid credentials not included in the list are intended to be removed from the authenticator, which will prevent the user from signing in with them. Passing an empty list may remove all of the user's credentials. Some authenticators may support restoring credentials via a subsequent call to `signalAllAcceptedCredentials()` with the previously removed credential IDs included in the list.

## Exceptions

The promise rejects with the following exceptions:

- `SecurityError` {{domxref("DOMException")}}
  - : The RP domain is not valid.
- `TypeError` {{domxref("DOMException")}}
  - : The `userId` or any of the `allAcceptedCredentialIds` elements are not valid base64url-encoded strings.

