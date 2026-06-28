# Fringe Cases

## Exceptions

The following exceptions may be thrown when setting a new value for this property:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if an attempt was made to set the value to `segments` when the
    initial value is `sequence`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("SourceBuffer")}} object is being updated (i.e.,
    its {{domxref("SourceBuffer.updating")}} property is
    currently `true`), the last media segment appended to this
    `SourceBuffer` is incomplete, or this
    `SourceBuffer` has been removed from the
    {{domxref("MediaSource")}}.

