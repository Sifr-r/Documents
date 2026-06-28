# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In this example we're using the `ws` protocol for the connection, because in the example we're connecting to localhost. In a real application, web pages should be served using HTTPS, and the WebSocket connection should use `wss` as the protocol.

## Security Notes

WebSockets should not be used in a mixed content environment; that is, you shouldn't open a non-secure WebSocket connection from a page loaded using HTTPS or vice versa.
Most browsers now only allow secure WebSocket connections, and no longer support using them in insecure contexts.

