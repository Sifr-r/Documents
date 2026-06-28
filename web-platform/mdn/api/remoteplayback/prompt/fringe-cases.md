# Fringe Cases

## Exceptions

The promise will be rejected with one of the following exceptions:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if {{domxref("HTMLMediaElement.disableRemotePlayback","disableRemotePlayback")}} is `true` for the media element.
- `OperationError` {{domxref("DOMException")}}
  - : Thrown if there is already an unsettled promise from a previous call to `prompt()` for this media element, or browsing context.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if the user has not interacted with this device recently.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the user agent knows that remote playback of this particular media is not feasible.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if remote playback is unavailable.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the user denies permission to use the device.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element in order for this feature to work.

