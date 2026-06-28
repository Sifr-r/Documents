# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the specified string is empty, rather than indicating a valid MIME type.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("SourceBuffer")}} is not a member of the parent media source's
    {{domxref("MediaSource.sourceBuffers", "sourceBuffers")}} list, or the buffer's
    {{domxref("SourceBuffer.updating", "updating")}} property indicates that a previously
    queued {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} or
    {{domxref("SourceBuffer.remove", "remove()")}} is still being processed.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the specified MIME type is not supported, or is not supported with the types of
    {{domxref("SourceBuffer")}} objects present in the
    {{domxref("MediaSource.sourceBuffers")}} list.

