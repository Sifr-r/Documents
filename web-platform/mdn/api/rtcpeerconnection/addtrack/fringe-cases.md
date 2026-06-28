# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Adding a track to a connection triggers renegotiation by firing a {{DOMxRef("RTCPeerConnection/negotiationneeded_event", "negotiationneeded")}} event.
> See [Starting negotiation](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling#starting_negotiation) for details.

> [!NOTE]
> Every `RTCRtpSender` is paired with an {{domxref("RTCRtpReceiver")}} to make up an {{domxref("RTCRtpTransceiver")}}.
> The associated receiver is muted (indicating that it is not able to deliver packets) until and unless one or more streams are added to the receiver by the remote peer.

## Exceptions

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if the specified track (or all of its underlying streams) is already part of the {{domxref("RTCPeerConnection")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("RTCPeerConnection")}} is closed.

