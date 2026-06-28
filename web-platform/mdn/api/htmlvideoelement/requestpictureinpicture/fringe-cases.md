# Fringe Cases

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the feature is not supported (for example, disabled by a user preference or by a platform limitation).
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the feature is blocked by a [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the video element's `readState` is `HAVE_NOTHING`, or if the video element has no video track, or if the video element's `disablePictureInPicture` attribute is `true`.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if `document.pictureInPictureElement` is `null` and the document does not have {{Glossary("transient activation")}}.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element for this feature to work.

