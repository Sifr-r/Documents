# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the `MediaRecorder` is currently `"inactive"`; you cannot pause
    the recording if the `MediaRecorder` is not active. If you call `pause()` while already paused,
    the method silently does nothing.

