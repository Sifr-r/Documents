# Fringe Cases

## Exceptions

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if either the {{domxref("MediaSource.duration")}} property is equal to `NaN`, the `start` parameter is negative or greater than {{domxref("MediaSource.duration")}}, or the `end` parameter is less than or equal to `start` or equal to `NaN`.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("SourceBuffer.updating")}} property is equal
    to `true`, or this `SourceBuffer` has been removed
    from {{domxref("MediaSource")}}.

