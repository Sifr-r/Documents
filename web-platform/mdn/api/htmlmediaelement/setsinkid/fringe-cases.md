# Fringe Cases

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Returned if a [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) is used to block use of audio outputs.
- `NotFoundError` {{domxref("DOMException")}}
  - : Returned if the `deviceId` does not match any audio output device.
- `AbortError` {{domxref("DOMException")}}
  - : Returned if switching the audio output device to the new audio device failed.

## Security Notes

Access to the API is subject to the following constraints:

- The method must be called in a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
- Access may be gated by the [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- User permission is required to access a non-default device.
  The user grants permission by selecting the device associated with the ID in the prompt displayed by {{domxref("MediaDevices.selectAudioOutput()")}}.

