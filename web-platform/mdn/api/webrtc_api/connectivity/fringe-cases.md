# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This page needs heavy rewriting for structural integrity and content completeness. Lots of info here is good but the organization is a mess since this is sort of a dumping ground right now.

> [!NOTE]
> The `pendingLocalDescription` contains not just the offer or answer under consideration, but any local ICE candidates which have already been gathered since the offer or answer was created. Similarly, `pendingRemoteDescription` includes any remote ICE candidates which have been provided by calls to {{domxref("RTCPeerConnection.addIceCandidate()")}}.

> [!NOTE]
> Generally, ICE candidates using TCP are only going to be used when UDP is not available or is restricted in ways that make it not suitable for media streaming. Not all browsers support ICE over TCP, however.

