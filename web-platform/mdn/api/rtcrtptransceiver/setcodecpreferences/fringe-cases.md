# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Any codecs not included in `codecs` will not be considered during the process of negotiating a connection.
    > This lets you prevent the use of codecs you don't wish to use.

## Exceptions

- `InvalidAccessError` {{domxref("DOMException")}}
  - : The `codecs` list includes one or more codecs which are not supported by the {{domxref("RTCRtpReceiver")}} associated with the transceiver.
- `InvalidModificationError` {{domxref("DOMException")}}
  - : The `codecs` list only contains entries for RTX, RED, FEC or Comfort Noise, or is an empty set.
    The codecs must always contain a codec for the media.

