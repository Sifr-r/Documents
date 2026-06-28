# Fringe Cases

## Exceptions

The {{jsxref("Promise")}} may be rejected with one of the following `DOMException` values:

- `InvalidStateError` {{domxref("DOMException")}}
  - : The document is not fully active, or other sharing operations are in progress.
- `NotAllowedError` {{domxref("DOMException")}}
  - : A `web-share` [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) has been used to block the use of this feature, the window does not have {{Glossary("transient activation")}}, or a file share is being blocked due to security considerations.
- {{jsxref("TypeError")}}
  - : The specified share data cannot be validated. Possible reasons include:
    - The `data` parameter was omitted completely or only contains properties with unknown values. Note that any properties that are not recognized by the user agent are ignored.
    - A URL is badly formatted.
    - Files are specified but the implementation does not support file sharing.
    - Sharing the specified data would be considered a "hostile share" by the user-agent.

- `AbortError` {{domxref("DOMException")}}
  - : The user canceled the share operation or there are no share targets available.
- `DataError` {{domxref("DOMException")}}
  - : There was a problem starting the share target or transmitting the data.

## Security Notes

This method requires that the current document have the [web-share](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/web-share) Permissions Policy and {{Glossary("transient activation")}}. (It must be triggered off a UI event like a button click and cannot be launched at arbitrary points by a script.) Further, the method must specify valid data that is supported for sharing by the native implementation.

