# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The important thing to note is this: the only thing your code is responsible for during ICE negotiation is accepting outgoing candidates from the ICE layer and sending them across the signaling connection to the other peer when your {{domxref("RTCPeerConnection.icecandidate_event", "onicecandidate")}} handler is executed, and receiving ICE candidate messages from the signaling server (when the `"new-ice-candidate"` message is received) and delivering them to your ICE layer by calling {{domxref("RTCPeerConnection.addIceCandidate()")}}. That's it.
>
> The contents of the SDP are irrelevant to you in essentially all cases. Avoid the temptation to try to make it more complicated than that until you really know what you're doing. That way lies madness.

> [!NOTE]
> The {{domxref("RTCPeerConnection.icecandidate_event", "onicecandidate")}} Event and {{domxref("RTCPeerConnection.createAnswer", "createAnswer()")}} Promise are both async calls which are handled separately. Be sure that your signaling does not change order! For example {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}} with the server's ice candidates must be called after setting the answer with {{domxref("RTCPeerConnection.setRemoteDescription", "setRemoteDescription()")}}.

> [!NOTE]
> Obviously, it would be more efficient to update the list by adding and removing individual users instead of rebuilding the whole list every time it changes, but this is good enough for the purposes of this example.

> [!NOTE]
> We could restrict the set of permitted media inputs to a specific device or set of devices by calling {{domxref("MediaDevices.enumerateDevices", "navigator.mediaDevices.enumerateDevices()")}} to get a list of devices, filtering the resulting list based on our desired criteria, then using the selected devices' {{domxref("MediaTrackConstraints.deviceId", "deviceId")}} values in the `deviceId` field of the `mediaConstraints` object passed into `getUserMedia()`. In practice, this is rarely if ever necessary, since most of that work is done for you by `getUserMedia()`.

> [!NOTE]
> You should always use STUN/TURN servers which you own, or which you have specific authorization to use. This example is using a known public STUN server but abusing these is bad form.

> [!NOTE]
> Technically speaking, the string returned by `createOffer()` is an {{RFC(3264)}} offer.

> [!NOTE]
> As is the case with the caller, once the `setLocalDescription()` fulfillment handler has run, the browser begins firing {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} events that the callee must handle, one for each candidate that needs to be transmitted to the remote peer.

> [!NOTE]
> It's important to keep in mind that the {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} event is **not** sent when ICE candidates arrive from the other end of the call. Instead, they're sent by your own end of the call so that you can take on the job of transmitting the data over whatever channel you choose. This can be confusing when you're new to WebRTC.

> [!NOTE]
> We don't watch the `disconnected` signaling state here as it can indicate temporary issues and may go back to a `connected` state after some time. Watching it would close the video call on any temporary network issue.

> [!NOTE]
> The `closed` signaling state has been deprecated in favor of the `closed` {{domxref("RTCPeerConnection.iceConnectionState", "iceConnectionState")}}. We are watching for it here to add a bit of backward compatibility.

