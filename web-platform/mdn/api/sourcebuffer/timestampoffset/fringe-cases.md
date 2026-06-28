# Fringe Cases

## Exceptions

The following exception may be thrown when setting a new value for this property:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if one or more of the {{domxref("SourceBuffer")}} objects in
    {{domxref("MediaSource.sourceBuffers")}} are being updated
    (i.e., their {{domxref("SourceBuffer.updating")}} property is
    currently `true`), a media segment inside the
    `SourceBuffer` is currently being parsed, or this
    `SourceBuffer` has been removed from the
    {{domxref("MediaSource")}}.

