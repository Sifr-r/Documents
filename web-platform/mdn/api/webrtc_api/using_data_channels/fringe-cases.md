# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Since all WebRTC components are required to use encryption, any data transmitted on an `RTCDataChannel` is automatically secured using Datagram Transport Layer Security (**DTLS**). See [Security](#security) below for more information.

## Security Notes

All data transferred using WebRTC is encrypted. In the case of `RTCDataChannel`, the encryption used is Datagram Transport Layer Security (DTLS), which is based on [Transport Layer Security](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security) (TLS). Since TLS is used to secure every HTTPS connection, any data you send on a data channel is as secure as any other data sent or received by the user's browser.

More fundamentally, since WebRTC is a peer-to-peer connection between two user agents, the data never passes through the web or application server. This reduces opportunities to have the data intercepted.

