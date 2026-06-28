# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > A user agent may choose to skip prompting the user if a specified non-null id was previously exposed to the user by `selectAudioOutput()` in an earlier session.
        > In this case the user agent may simply resolve with this device id, or a new id for the same device if it has changed.
        > If permission for the specified device was previously granted but has since been revoked, the user-agent might display all allowed devices, highlighting the one with the specified ID.

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Returned if a [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) is used to block use of audio outputs (in addition the popup for selecting an audio output won't be displayed), or the user closed the selection prompt without choosing a device.
- `NotFoundError` {{domxref("DOMException")}}
  - : Returned if there are no available audio output devices.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if there hasn't been a {{Glossary("transient activation")}} (you must trigger it from some kind of UI event).

## Security Notes

Access to the API is subject to the following constraints:

- The method must be called in a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
- [Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required.
  The user has to interact with the page or a UI element for this feature to work.
- Access may be gated by the [`speaker-selection`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/speaker-selection) HTTP [Permission Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

The permission status can be queried using the [Permissions API](/en-US/docs/Web/API/Permissions_API) method {{domxref("Permissions.query", "navigator.permissions.query()")}}, passing a permission descriptor with the `speaker-selection` permission.

