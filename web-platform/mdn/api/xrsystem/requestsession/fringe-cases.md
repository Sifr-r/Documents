# Fringe Cases

## Exceptions

This method doesn't throw true exceptions; instead, it rejects the returned promise,
passing into it a {{domxref("DOMException")}} whose `name` is one of the
following:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the requested session mode is `immersive-vr` but there is already an
    immersive VR session either currently active or in the process of being set up. There
    can only be one immersive VR session at a time.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Returned if there is no WebXR-compatible device available, or the device does not support the
    specified `sessionMode`; this can also be thrown if any of the
    _required_ options are unsupported.
- `SecurityError` {{domxref("DOMException")}}
  - : Returned if permission to enter the specified XR mode is denied. This can happen for several reasons, which are covered in more detail in [Permissions and security](/en-US/docs/Web/API/WebXR_Device_API/Permissions_and_security).

## Security Notes

Several session features and the various reference spaces have minimum security and privacy requirements, like asking for user consent and/or requiring the {{HTTPHeader("Permissions-Policy")}}: [`xr-spatial-tracking`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/xr-spatial-tracking) directive to be set. See also [Permissions and security](/en-US/docs/Web/API/WebXR_Device_API/Permissions_and_security) for more details.

| Session feature | User consent requirement            | Permissions policy requirement |
| --------------- | ----------------------------------- | ------------------------------ |
| `bounded-floor` | Always required                     | `xr-spatial-tracking`          |
| `depth-sensing` | —                                   | `xr-spatial-tracking`          |
| `hand-tracking` | Always required                     | —                              |
| `hit-test`      | —                                   | `xr-spatial-tracking`          |
| `local`         | Always required for inline sessions | `xr-spatial-tracking`          |
| `local-floor`   | Always required                     | `xr-spatial-tracking`          |
| `unbounded`     | Always required                     | `xr-spatial-tracking`          |
| `viewer`        | Always required                     | —                              |

See also [transient user activation](/en-US/docs/Web/Security/Defenses/User_activation).

