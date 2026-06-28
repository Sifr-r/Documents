# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Unlike {{domxref("RTCPeerConnection.localDescription")}}, this value represents the actual current state of the local end of the connection;
> `localDescription` may specify a description which the connection is currently in the process of switching over to.

> [!NOTE]
> The addition of `currentLocalDescription` and {{domxref("RTCPeerConnection.pendingLocalDescription", "pendingLocalDescription")}} to the WebRTC spec is relatively recent.
> In browsers which don't support them, just use {{domxref("RTCPeerConnection.localDescription", "localDescription")}}.

