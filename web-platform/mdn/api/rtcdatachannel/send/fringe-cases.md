# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Different browsers have different limitations on the size of the message you can
> send. Specifications exist to define how to automatically fragment large messages, but
> not all browsers implement them, and those that do have various additional
> restrictions. This will get less complicated over time, but for now, if you have
> questions, see [Understanding message size limits](/en-US/docs/Web/API/WebRTC_API/Using_data_channels#understanding_message_size_limits).

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown when the data channel has not finished establishing its own connection (that is, its
    {{domxref("RTCDataChannel.readyState", "readyState")}} is `connecting`). The data channel
    must establish its own connection because it uses a transport channel separate from that of the media content. This error occurs without sending or buffering the `data`.
- `OperationError` {{domxref("DOMException")}}
  - : Thrown when the specified `data` would need to be buffered, and there isn't room for it in the buffer.
- {{jsxref("TypeError")}}
  - : Thrown if the specified `data` is too large for the other peer to receive. Since
    there are multiple techniques for breaking up large data into smaller pieces for
    transfer, it's possible to encounter scenarios in which the other peer does not
    support the same ones. For example, if one peer is a modern browser that supports
    using the `EOR` (End of Record) flag to indicate when a received message is
    the last piece of a multi-part object sent using `send()`. For more
    information about message size restrictions, see
    [Understanding message size limits](/en-US/docs/Web/API/WebRTC_API/Using_data_channels#understanding_message_size_limits).

