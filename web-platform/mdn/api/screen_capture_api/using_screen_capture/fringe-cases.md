# Fringe Cases

## Warnings & Notes

> [!NOTE]
> It may be useful to note that recent versions of the [WebRTC adapter.js shim](https://github.com/webrtcHacks/adapter) include implementations of `getDisplayMedia()` to enable screen sharing on browsers that support it but do not implement the current standard API. This works with at least Chrome, Edge, and Firefox.

> [!NOTE]
> Constraints _never_ cause changes to the list of sources available for capture by the Screen Sharing API. This ensures that web applications can't force the user to share specific content by restricting the source list until only one item is left.

> [!NOTE]
> For privacy and security reasons, screen sharing sources are not enumerable using {{domxref("MediaDevices.enumerateDevices", "enumerateDevices()")}}. Related to this, the {{domxref("MediaDevices/devicechange_event", "devicechange")}} event is never sent when there are changes to the sources available for `getDisplayMedia()`.

## Security Notes

In order to function when [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) is enabled, you will need the `display-capture` permission. This can be done using the {{HTTPHeader("Permissions-Policy")}} {{Glossary("HTTP")}} header or—if you're using the Screen Capture API in an {{HTMLElement("iframe")}}, the `<iframe>` element's [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow) attribute.

For example, this line in the HTTP headers will enable Screen Capture API for the document and any embedded {{HTMLElement("iframe")}} elements that are loaded from the same origin:

```http
Permissions-Policy: display-capture=(self)
```

If you're performing screen capture within an `<iframe>`, you can request permission just for that frame, which is clearly more secure than requesting permission more generally:

```html
<iframe src="https://mycode.example.net/etc" allow="display-capture"> </iframe>
```

