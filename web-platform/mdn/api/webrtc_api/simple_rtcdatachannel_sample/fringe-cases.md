# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Even though both ends of our connection will be on the same page, we're going to refer to the one that starts the connection as the "local" one, and to the other as the "remote" end.

> [!NOTE]
> In a real-world scenario in which the two peers aren't running in the same context, the process is a bit more involved; each side provides, one at a time, a suggested way to connect (for example, UDP, UDP with a relay, TCP, etc.) by calling {{domxref("RTCPeerConnection.addIceCandidate()")}}, and they go back and forth until agreement is reached. But here, we just accept the first offer on each side, since there's no actual networking involved.

> [!NOTE]
> Once again, this process is not a real-world implementation; in normal usage, there's two chunks of code running on two machines, interacting and negotiating the connection. A side channel, commonly called a "signalling server," is usually used to exchange the description (which is in **application/sdp** form) between the two peers.

