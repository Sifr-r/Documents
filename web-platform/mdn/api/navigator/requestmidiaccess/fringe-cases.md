# Fringe Cases

## Exceptions

- `AbortError` {{domxref("DOMException")}}
  - : Thrown if the document or page is closed due to user navigation.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the underlying system raises any errors.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the feature or options are not supported by the system.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the user or system denies the application from creating a [MIDIAccess](/en-US/docs/Web/API/MIDIAccess) object with the requested options, or if the document is not allowed to use the feature (for example, because of a [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy), or because the user previously denied a permission request).

## Security Notes

Access to the API is subject to the following constraints:

- The method must be called in a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
- Access may be gated by the [`midi`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/midi) HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- The user must explicitly grant permission to use the API though a user-agent specific mechanism, or have previously granted permission.
  Note that if access is denied by a permission policy it cannot be granted by a user permission.

The permission status can be queried using the [Permissions API](/en-US/docs/Web/API/Permissions_API) method [`navigator.permissions.query()`](/en-US/docs/Web/API/Permissions/query), passing a permission descriptor with the `midi` permission and (optional) `sysex` property:

```js
navigator.permissions.query({ name: "midi", sysex: true }).then((result) => {
  if (result.state === "granted") {
    // Access granted.
  } else if (result.state === "prompt") {
    // Using API will prompt for permission
  }
  // Permission was denied by user prompt or permission policy
});
```

