# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Usage of this feature may be blocked by a {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) set on your server. In addition, the document must pass additional browser-specific checks such as allowlists, blocklists, on-device classification, user settings, anti-[clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) heuristics, or prompting the user for explicit permission.

> [!NOTE]
> See [Using the Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using) for a more complete example.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if:
    - The current {{domxref("Document")}} is not yet active.
    - The `types` parameter is provided and all of its properties are `false`.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if:
    - The document's window is not a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
    - Usage is blocked by a {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
    - The document or the top-level document has a `null` origin.
    - The embedding {{htmlelement("iframe")}} is sandboxed, and the `allow-storage-access-by-user-activation` token is not set.
    - Usage is denied by the user agent's permission request to use the API.

