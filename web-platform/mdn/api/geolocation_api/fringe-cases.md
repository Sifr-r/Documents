# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The {{htmlelement("geolocation")}} element provides an alternative mechanism for accessing and handling geolocation data that solves some of the shortcomings of the Geolocation API: It provides a consistent UI, and a more intuitive permission management process.

## Security Notes

The Geolocation API allows users to programmatically access location information in [secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Access may further be controlled by the [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) directive {{HTTPHeader("Permissions-Policy/geolocation","geolocation")}}.
The default allowlist for `geolocation` is `self`, which allows access to location information in same-origin nested frames only.
Third party usage is enabled by setting a `Permissions-Policy` response header to grant permission to a particular third party origin:

```http
Permissions-Policy: geolocation=(self b.example.com)
```

The `allow="geolocation"` attribute must then be added to the iframe element with sources from that origin:

```html
<iframe src="https://b.example.com" allow="geolocation"></iframe>
```

Geolocation data may reveal information that the device owner does not want to share.
Therefore, users must grant explicit permission via a prompt when either {{domxref("Geolocation.getCurrentPosition()")}} or {{domxref("Geolocation.watchPosition()")}} is called (unless the permission state is already `granted` or `denied`).
The lifetime of a granted permission depends on the user agent, and may be time based, session based, or even permanent.
The [Permissions API](/en-US/docs/Web/API/Permissions_API) `geolocation` permission can be used to test whether access to use location information is `granted`, `denied` or `prompt` (requires user acknowledgement of a prompt).

