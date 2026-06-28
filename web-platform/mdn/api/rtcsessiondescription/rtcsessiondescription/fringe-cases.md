# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This constructor has been deprecated because
> {{domxref("RTCPeerConnection.setLocalDescription()")}} and other methods which take
> SDP as input now directly accept an object containing the {{domxref("RTCSessionDescription.type", "type")}} and {{domxref("RTCSessionDescription.sdp", "sdp")}} properties, so you don't have to instantiate an
> `RTCSessionDescription` yourself.

> [!NOTE]
> This is no longer necessary, however;
> {{domxref("RTCPeerConnection.setLocalDescription()")}} and other methods which take
> SDP as input now directly accept plain objects, so you don't have to instantiate an
> `RTCSessionDescription` yourself.

