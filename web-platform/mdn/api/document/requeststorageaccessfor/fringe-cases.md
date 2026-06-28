# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Usage of this feature may be blocked by a {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) set on your server (the same one that controls the rest of the Storage Access API). In addition, the document must pass additional browser-specific checks such as allowlists, blocklists, on-device classification, user settings, or anti-[clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) heuristics.

> [!NOTE]
> See [Using the Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using) for a more complete example.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the current {{domxref("Document")}} is not yet active.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if:
    - The document's window is not a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
    - The document is not the top-level document.
    - The document has a `null` origin.
    - The supplied `requestedOrigin` is [opaque](https://html.spec.whatwg.org/multipage/browsers.html#concept-origin-opaque).
    - The top-level and embedded sites are not in the same [related website set](https://privacysandbox.google.com/cookies/related-website-sets-integration).
    - The embedding {{htmlelement("iframe")}} is sandboxed, and the `allow-storage-access-by-user-activation` token is not set.
    - Usage is blocked by a {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
    - Usage is denied by the user agent's permission request to use the API.
- `TypeError`
  - : Thrown if `requestedOrigin` is not a valid URL.

