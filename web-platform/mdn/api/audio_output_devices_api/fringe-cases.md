# Fringe Cases

## Security Notes

Access to the API is subject to the following constraints:

- All methods and properties may only be called in a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

- {{domxref("MediaDevices.selectAudioOutput()")}} grants user permission for a selected device to be used as the audio output sink:
  - Access may be gated by the [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
  - [Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required.
    The user has to interact with the page or a UI element for the method to be called.

- {{domxref("HTMLMediaElement.setSinkId()")}} sets a permitted ID as the audio output:
  - Access may be gated by the [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
  - User permission is required to set a non-default device ID.
    - This can come from selection in the prompt launched by `MediaDevices.selectAudioOutput()`
    - User permission to set the output device is also implicitly granted if the user has already granted permission to use a media input device in the same group with {{domxref("MediaDevices.getUserMedia()")}}.

<!-- The line below is "true" but this is not implemented in any browser -->
<!-- The permission status can be queried using the [Permissions API](/en-US/docs/Web/API/Permissions_API) method [`navigator.permissions.query()`](/en-US/docs/Web/API/Permissions/query), passing a permission descriptor with the `speaker-selection` permission. -->

