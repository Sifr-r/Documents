# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Use this API in preference to the deprecated {{domxref("document.execCommand()")}} method for accessing the clipboard.

> [!NOTE]
> This API is _not available_ in [Web Workers](/en-US/docs/Web/API/Web_Workers_API) (not exposed via {{domxref("WorkerNavigator")}}).

## Security Notes

The Clipboard API allows users to programmatically read and write text and other kinds of data to and from the system clipboard in [secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

When reading from the clipboard, the specification requires that a user has recently interacted with the page ([transient user activation](/en-US/docs/Web/Security/Defenses/User_activation)) and that the call is made as a result of the user interacting with a browser or OS "paste element" (such as choosing "Paste" on a native context menu). In practice, browsers often allow read operations that do not satisfy these requirements, while placing other requirements instead (such as a permission or per-operation prompt).
For writing to the clipboard the specification expects that the page has been granted the [Permissions API](/en-US/docs/Web/API/Permissions_API) `clipboard-write` permission, and the browser may also require [transient user activation](/en-US/docs/Web/Security/Defenses/User_activation).
Browsers may place additional restrictions over use of the methods to access the clipboard.

The {{domxref("Clipboard.clipboardchange_event", "clipboardchange")}} event is only fired with [sticky activation](/en-US/docs/Glossary/Sticky_activation) or after the `clipboard-read` permission is granted.

Browser implementations have diverged from the specification.
The differences are captured in the [Browser compatibility](#browser_compatibility) section and the current state is summarized below:

Chromium browsers:

- If a read isn't allowed by the spec and the document has focus, it triggers a request to use permission `clipboard-read`, and succeeds if the permission is granted (either because the user accepted the prompt, or because the permission was granted already).
- Writing requires either the `clipboard-write` permission or transient activation.
  If the permission is granted, it persists, and further transient activation is not required.
- The HTTP [Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy) permissions `clipboard-read` and `clipboard-write` must be allowed for {{HTMLElement("iframe")}} elements that access the clipboard.

Firefox & Safari:

- If a read isn't allowed by the spec but transient user activation is still met, it triggers a user prompt in the form of an ephemeral context menu with a single "Paste" option (which becomes enabled after 1 second) and succeeds if the user chooses the option.
- Writing requires transient activation.
- The paste-prompt is suppressed if reading same-origin clipboard content, but not cross-origin content.
- The `clipboard-read` and `clipboard-write` permissions are not supported (and not planned to be supported) by Firefox or Safari.

Firefox [web extensions](/en-US/docs/Mozilla/Add-ons/WebExtensions/Interact_with_the_clipboard):

- Reading is available to extensions with the web extension [`clipboardRead`](/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/permissions#clipboardread) permission. With this permission, the extension doesn't require transient activation or use the paste prompt. From Firefox 147, reading is also available without the permission in a secure context, with transient activation, and after the user clicks the paste prompt in an ephemeral context menu.
- Writing is available in a secure context and with transient activation. However, with the web extension [`clipboardWrite`](/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/permissions#clipboardwrite) permission transient activation is not required.

