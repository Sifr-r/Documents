# Fringe Cases

## Warnings & Notes

> [!NOTE]
> While you can determine that ICE candidate gathering is complete by watching for `icegatheringstatechange` events and checking for the value of {{domxref("RTCPeerConnection.iceGatheringState", "iceGatheringState")}} to become `complete`, you can also have your handler for the {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} event look to see if its {{domxref("RTCPeerConnectionIceEvent.candidate", "candidate")}} property is `null`. This also indicates that collection of candidates is finished.

