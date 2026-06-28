# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Keep in mind that this is part of the signaling process, the transport layer for which is an implementation detail that's entirely up to you.
> In this case, a [WebSocket](/en-US/docs/Web/API/WebSockets_API) connection is used to send a {{Glossary("JSON")}} message with a `type` field with the value "video-answer" to the other peer, carrying the answer to the device which sent the offer to connect.
> The contents of the object being passed to the `sendToServer()` function, along with everything else in the promise fulfillment handler, depend entirely on your design

## Exceptions

- `NotReadableError`
  - : The identity provider wasn't able to provide an identity assertion.
- `OperationError`
  - : Generation of the SDP failed for some reason; this is a general failure catch-all exception.

