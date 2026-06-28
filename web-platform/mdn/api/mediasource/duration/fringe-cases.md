# Fringe Cases

## Exceptions

The following exceptions may be thrown when setting a new value for this property.

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if an attempt was made to set a duration value that was negative or `NaN`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if {{domxref("MediaSource.readyState")}} is not equal to
    `open`, or one or more of the
    {{domxref("SourceBuffer")}} objects in
    {{domxref("MediaSource.sourceBuffers")}} are being updated
    (i.e., their {{domxref("SourceBuffer.updating")}} property is
    `true`.)

