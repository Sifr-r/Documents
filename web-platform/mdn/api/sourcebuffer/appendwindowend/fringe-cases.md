# Fringe Cases

## Exceptions

The following exceptions may be thrown when setting a new value for this property:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if an attempt was made to set the value to less than or equal to
    {{domxref("SourceBuffer.appendWindowStart")}} or `NaN`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if this {{domxref("SourceBuffer")}} object is being updated (i.e.,
    its {{domxref("SourceBuffer.updating")}} property is
    currently `true`), or this `SourceBuffer` has been
    removed from the {{domxref("MediaSource")}}.

