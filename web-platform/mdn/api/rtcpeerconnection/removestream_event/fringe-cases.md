# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This event has been removed from the WebRTC specification in favor of the existing {{DOMxRef("MediaStream/removetrack_event", "removetrack")}} event on the remote {{domxref("MediaStream")}} and the corresponding event handler property of the remote {{domxref("MediaStream")}}. The {{domxref("RTCPeerConnection")}} API is now track-based, so having zero tracks in the remote stream is equivalent to the remote stream being removed, which caused a `removestream` event.

