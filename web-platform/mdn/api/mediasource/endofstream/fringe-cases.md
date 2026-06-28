# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if {{domxref("MediaSource.readyState")}} is not equal to `open`, or one or more of the {{domxref("SourceBuffer")}} objects in {{domxref("MediaSource.sourceBuffers")}} are being updated (i.e., their {{domxref("SourceBuffer.updating")}} property is
    `true`.)

