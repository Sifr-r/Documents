# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `WebSocket` API has no way to apply [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure), therefore when messages arrive faster than the application can process them, the application will either fill up the device's memory by buffering those messages, become unresponsive due to 100% CPU usage, or both. For an alternative that provides backpressure automatically, see {{domxref("WebSocketStream")}}.

