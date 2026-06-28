# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The [storage access headers](#storage_access_headers) are an HTTP extension to the API that enables a more efficient storage API workflow, and can also be used to activate a previously granted storage access permission for passive resources, such as images.

   > [!NOTE]
   > Older spec versions used the more specific permission key structure `<top-level site, embedded origin>`, which meant that same-site, cross-origin embeds didn't match the permission key and had to go through the whole process separately.

   > [!NOTE]
   > In older spec versions, the access was _per-page_ (Safari is the only browser still using this model). When one embed received third-party cookie access via `requestStorageAccess()`, all other same-site embeds would automatically receive access.
   > This was not desirable behavior from a security standpoint — for example, if `shop.example.com` embedded `locator.users.com` to allow users to use their location info while shopping, and `locator.users.com` called `requestStorageAccess()`, `shop.example.com` and any other sites it embeds would be able to access its cookies, but also access cookies from `private.users.com`, which is not intended to be embedded. [Read more about the motivations](https://github.com/privacycg/storage-access/issues/113) behind this change.

> [!NOTE]
> These headers do not provide a mechanism to grant the storage access permission in the first place.
> Permission must always be requested by the embedded resource calling `requestStorageAccess()` with transient activation.

> [!NOTE]
> Because we can't use the headers to grant permission, we need to load the resource without cookies so that it can request the permission.
> This is the same sequence as if the headers were not applied.

> [!NOTE]
> The document may also be required to pass additional browser-specific checks. Examples: allowlists, blocklists, on-device classification, user settings, anti-[clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) heuristics, or prompting the user for explicit permission.

> [!NOTE]
> User interaction propagates to the promise returned by these methods, allowing the callers to take actions requiring user interaction without requiring a second click. For example, a caller could open a pop-up window from the resolved promise without triggering Firefox's pop-up blocker.

## Security Notes

Several different security measures could cause a {{domxref("Document.requestStorageAccess()")}} call to fail.
Check the below list if you are having trouble getting a request to work:

1. The permission request must be associated with a user gesture ({{Glossary("transient activation")}}) such as a tap or click.
   This prevents embedded content on the page from spamming the browser or user with excessive access requests.
   Note that this isn't required if:
   - Permission to use the API has already been granted to another context with the same `<top-level site, embedded site>` key.
   - The caller is a top-level document or same-site to the top-level document.
     In such cases, `requestStorageAccess()` probably doesn't need to be called at all.
2. The document and top-level document must not have a `null` origin.
3. Origins that have never been interacted with as a first party do not have a notion of first-party storage. From the user's perspective, they only have a third-party relationship with that origin. Access requests are automatically denied if the browser detects that the user hasn't interacted with the embedded content in a first-party context recently (in Firefox, "recently" means within 30 days).
4. The document's window must be a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
5. Sandboxed {{htmlelement("iframe")}}s cannot be granted storage access by default for security reasons.
   To handle this, the API provides the [`allow-storage-access-by-user-activation`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow-storage-access-by-user-activation) [sandbox token](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox).
   The `<iframe>` needs to include this to enable storage access requests, along with `allow-scripts` and `allow-same-origin` to allow it to execute a script to call the API and execute it in an origin that can have cookies/state:

   ```html
   <iframe
     sandbox="allow-storage-access-by-user-activation
                   allow-scripts
                   allow-same-origin">
     …
   </iframe>
   ```

6. Usage of this feature may be blocked by a {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) set on your server.

> [!NOTE]

