# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > The connection is not established until the sub-protocol is negotiated with the server.
    > The selected protocol can then be read from {{domxref("WebSocket.protocol")}}: it will be the empty string if a connection cannot be established.

## Exceptions

- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if:
    - parsing of [`url`](#url) fails
    - [`url`](#url) has a scheme other than `ws`, `wss`, `http`, or `https`
    - [`url`](#url) has a [fragment](/en-US/docs/Web/URI/Reference/Fragment)
    - any of the values in [`protocols`](#protocols) occur more than once, or otherwise fail to match the requirements for elements that comprise the value of [`Sec-WebSocket-Protocol`](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism#sec-websocket-protocol) fields as defined by the WebSocket Protocol specification

