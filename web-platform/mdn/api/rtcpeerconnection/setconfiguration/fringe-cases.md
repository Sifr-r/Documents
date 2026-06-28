# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You cannot change the identity information for a connection once it's already been set.

## Exceptions

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if one or more of the URLs specified in `configuration.iceServers` is a {{Glossary("TURN")}} server, but complete login information is not provided (that is, either the `username` or `credential` is missing, or if `credentialType` is `"password"` and `credential` is not a string).
    This prevents successful login to the server.
- `InvalidModificationError` {{domxref("DOMException")}}
  - : Thrown if the `configuration` includes changed identity information, but the connection already has identity information specified.
    This happens if `configuration.peerIdentity` or `configuration.certificates` are set and their values differ from the current configuration.
    This may also be thrown if there are changes to `configuration.bundlePolicy` or `configuration.rtcpMuxPolicy`, or to `configuration.iceCandidatePoolSize` when {{domxref("RTCPeerConnection.setLocalDescription()")}} has already been called.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("RTCPeerConnection")}} is closed.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if the `configuration.iceServers` contains no URLs or if one of the values in the list is invalid.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if `configuration.iceServers` contains a URL with a scheme that is not supported.

