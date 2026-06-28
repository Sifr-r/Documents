# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Keep in mind that this is part of the signaling process, the transport layer for which is an implementation detail that's entirely up to you.
> In this case, a [WebSocket](/en-US/docs/Web/API/WebSockets_API) connection is used to send a {{Glossary("JSON")}} message with a `type` field with the value "video-offer" to the other peer.
> The contents of the object being passed to the `sendToServer()` function, along with everything else in the promise fulfillment handler, depend entirely on your design.

## Exceptions

These exceptions are returned by rejecting the returned promise.
Your rejection handler should examine the received exception to determine which occurred.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the `RTCPeerConnection` is closed.
- `NotReadableError` {{domxref("DOMException")}}
  - : Returned if no certificate or set of certificates was provided for securing the connection, and `createOffer()` was unable to create a new one.
    Since all WebRTC connections are required to be secured, that results in an error.
- `OperationError` {{domxref("DOMException")}}
  - : Returned if examining the state of the system to determine resource availability in order to generate the offer failed for some reason.

