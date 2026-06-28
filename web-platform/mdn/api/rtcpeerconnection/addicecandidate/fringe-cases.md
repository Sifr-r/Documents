# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > For backward compatibility with older versions of the WebRTC specification, the constructor also accepts this string directly as an argument.

## Exceptions

When an error occurs while attempting to add the ICE candidate, the {{jsxref("Promise")}} returned by this method is rejected, returning one of the errors below as the {{domxref("DOMException.name", "name")}} attribute in the specified {{domxref("DOMException")}} object passed to the rejection handler.

- {{jsxref("TypeError")}}
  - : Returned if the specified candidate's {{domxref("RTCIceCandidate.sdpMid", "sdpMid")}} and {{domxref("RTCIceCandidate.sdpMLineIndex", "sdpMLineIndex")}} are both `null`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the `RTCPeerConnection` currently has no remote peer established ({{domxref("RTCPeerConnection.remoteDescription", "remoteDescription")}} is `null`).
- `OperationError` {{domxref("DOMException")}}
  - : Returned in one of the following situations:
    - The value specified for {{domxref("RTCIceCandidate.sdpMid", "sdpMid")}} is non-`null` and doesn't match the media description ID of any media description included within the {{domxref("RTCPeerConnection.remoteDescription", "remoteDescription")}}.
    - The specified value of {{domxref("RTCIceCandidate.sdpMLineIndex", "sdpMLineIndex")}} is greater than or equal to the number of media descriptions included in the remote description.
    - The specified {{domxref("RTCIceCandidate.usernameFragment", "ufrag")}}
      doesn't match the `ufrag` field in any of the remote descriptions being considered.
    - One or more of the values in the {{domxref("RTCIceCandidate", "candidate")}} string are invalid or could not be parsed.
    - Attempting to add the candidate fails for any reason.

