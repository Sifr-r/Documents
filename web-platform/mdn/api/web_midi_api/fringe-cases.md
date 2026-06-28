# Fringe Cases

## Security Notes

Access to the API is requested using the {{domxref("navigator.requestMIDIAccess()")}} method.

- The method must be called in a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
- Access may be gated by the [`midi`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/midi) HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- The user must explicitly grant permission to use the API through a user-agent specific mechanism, or have previously granted permission.
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

