# Fringe Cases

## Exceptions

On error the returned `Promise` rejects with one of the following values:

- {{jsxref("TypeError")}}
  - : The `TypeError` exception may be delivered in any of the following situations:
    - The document containing the element isn't fully active; that is, it's not the current active document.
    - The element is not contained by a document.
    - The element is not permitted to use the `fullscreen` feature, either because of [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) configuration or other access control features.
    - The element and its document are the same node.
    - The element is a [popover](/en-US/docs/Web/API/Popover_API) that is already being shown via {{domxref("HTMLElement.showPopover()")}}.

- `NotSupportedError` {{domxref("DOMException")}}
  - : The passed `options.keyboardLock` parameter is not supported by the browser.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required.
The user has to interact with the page or a UI element in order for this feature to work.

Fullscreen mode is controlled by the [Permissions-Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) directive {{HTTPHeader("Permissions-Policy/fullscreen","fullscreen")}}.

The default allowlist for `screen-wake-lock` is `self`.
This allows fullscreen usage in same-origin nested frames but prevents them in third-party content.
Third party usage can be enabled by the server first setting the `Permissions-Policy` header to grant permission a particular third party origin.

```http
Permissions-Policy: fullscreen=(self b.example.com)
```

Then the `allow="fullscreen"` attribute must be added to the frame container element for sources from that origin:

```html
<iframe src="https://b.example.com" allow="fullscreen"></iframe>
```

The [Permissions API](/en-US/docs/Web/API/Permissions_API) `fullscreen` permission can be used to test whether access to use the mode is `granted`, `denied` or `prompt` (requires user acknowledgement of a prompt).

