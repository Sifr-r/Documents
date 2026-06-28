# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if an `audioTrack` is specified and one or both of the following are true:
    - The track's {{domxref("MediaStreamTrack.kind", "kind")}} property is not `audio`.
    - The track's {{domxref("MediaStreamTrack.readyState", "readyState")}} property is not `live`.

