# Fringe Cases

## Security Notes

Access to the Screen Wake Lock API is controlled by the [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) directive {{HTTPHeader("Permissions-Policy/screen-wake-lock","screen-wake-lock")}}.

When using the [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), the default allowlist for `screen-wake-lock` is `self`.
This allows lock wake usage in same-origin nested frames but prevents third-party content from using locks.
Third party usage can be enabled by the server first setting the `Permissions-Policy` header to grant permission a particular third party origin.

```http
Permissions-Policy: screen-wake-lock=(self b.example.com)
```

Then the `allow="screen-wake-lock"` attribute must be added the frame container element for sources from that origin:

```html
<iframe src="https://b.example.com" allow="screen-wake-lock"></iframe>
```

Browsers may also block the screen lock in a particular document for an implementation specific reason, such as a user or platform setting.
They are expected to provide some unobtrusive mechanism to inform the user when wake lock is active, and to provide users the ability to remove the application's screen lock.

The [Permissions API](/en-US/docs/Web/API/Permissions_API) `screen-wake-lock` permission can be used to test whether access to use the screen lock is `granted`, `denied` or `prompt` (requires user acknowledgement of a prompt).

