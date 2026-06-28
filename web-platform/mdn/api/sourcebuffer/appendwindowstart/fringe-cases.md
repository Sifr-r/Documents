# Fringe Cases

## Exceptions

The following exceptions may be thrown when setting a new value for this property:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if an attempt was made to set the value to less than 0 or to a value greater
    than or equal to
    {{domxref("SourceBuffer.appendWindowEnd")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if this {{domxref("SourceBuffer")}} object is being updated (i.e.,
    its {{domxref("SourceBuffer.updating")}} property is
    currently `true`), or this `SourceBuffer` has been
    removed from the {{domxref("MediaSource")}}.

