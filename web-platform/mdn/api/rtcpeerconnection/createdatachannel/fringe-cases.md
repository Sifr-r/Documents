# Fringe Cases

## Warnings & Notes

> [!NOTE]
> These options represent the script-settable subset of the properties on the {{domxref("RTCDataChannel")}} interface.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("RTCPeerConnection")}} is closed.
- {{jsxref("TypeError")}}
  - : Thrown in the following situations:
    - The label and/or protocol string is too long; these cannot be longer than 65,535 bytes (bytes, rather than characters).
    - The `id` is 65535. While this is a valid unsigned 16-bit value, it's not a permitted value for `id`.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if values were specified for both the `maxPacketLifeTime` and `maxRetransmits` options.
    You may specify a non-`null` value for only one of these.
- `ResourceInUse` {{domxref("DOMException")}}
  - : Thrown if an `id` was specified, but another {{domxref("RTCDataChannel")}} is already using the same value.
- `OperationError` {{domxref("DOMException")}}
  - : Thrown if either the specified `id` is already in use, or if no `id` was specified, the WebRTC layer was unable to automatically generate an ID because all IDs are in use.

