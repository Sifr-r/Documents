# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The process of changing descriptions actually involves intermediary steps handled by the WebRTC layer to ensure that an active connection can be changed without losing the connection if the change does not succeed.
> See [Pending and current descriptions](/en-US/docs/Web/API/WebRTC_API/Connectivity#pending_and_current_descriptions) in the WebRTC Connectivity page for more details on this process.

> [!NOTE]
> Earlier implementations of WebRTC would throw an exception if an offer was set outside a `stable` or `have-remote-offer` state.

## Exceptions

The following exceptions are reported to the rejection handler for the promise returned by `setRemoteDescription()`:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Returned if the content of the description is invalid.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the {{domxref("RTCPeerConnection")}} is closed, or it's in a state that is not compatible with the specified description's
    {{domxref("RTCSessionDescription.type", "type")}}.
    For example, this exception is thrown if the `type` is `rollback` and the signaling state is one of `stable`, `have-local-pranswer`, or `have-remote-pranswer` because you cannot roll back a connection that's either fully established or is in the final stage of becoming connected.
- `OperationError` {{domxref("DOMException")}}
  - : Returned if an error does not match the ones specified here. This includes identity validation errors.
- `RTCError` {{domxref("DOMException")}}
  - : Returned with the {{domxref("RTCError.errorDetail", "errorDetail")}} set to `sdp-syntax-error` if the {{Glossary("SDP")}} specified by {{domxref("RTCSessionDescription.sdp")}} is not valid.
    The error object's {{domxref("RTCError.sdpLineNumber", "sdpLineNumber")}} property indicates the line number within the SDP on which the syntax error was detected.
- {{jsxref("TypeError")}}
  - : Returned if the `sessionDescription` is missing the {{domxref("RTCSessionDescription.type", "type")}} property, or no description parameter was provided at all.

When using the deprecated callback-based version of `setRemoteDescription()`, the following exceptions may occur:

- `InvalidStateError` {{deprecated_inline}}
  - : The connection's {{domxref("RTCPeerConnection.signalingState", "signalingState")}} is `"closed"`, indicating that the connection is not currently open, so negotiation cannot take place.
- `InvalidSessionDescriptionError` {{deprecated_inline}}
  - : The `sessionDescription` parameter is invalid.

