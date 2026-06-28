# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown in one of the following cases:
    - The `SourceBuffer` object's `updating` attribute is `true`. You must wait for any previous append, update, or remove operations to complete (indicated by the `updateend` event) before calling `appendBuffer()` again.
    - The `SourceBuffer` has been removed from the `sourceBuffers` attribute of the parent media source.
    - The `HTMLMediaElement`'s `error` attribute is not `null`.
- {{domxref("QuotaExceededError")}}
  - : The buffer is full, and no more data can be appended. This might occur if the `SourceBuffer` has reached a browser-defined limit on the amount of buffered data.

Additionally, errors can occur after the `updatestart` event has been fired and the `appendBuffer()` method has returned: for example, because the buffer contained bytes that were incorrectly formatted. In this situation the `error` event will be fired on this `SourceBuffer` instance.

