# Fringe Cases

## Exceptions

When setting the value of `direction`, the following exception can occur:

- `InvalidStateError` {{domxref("DOMException")}}
  - : The receiver's {{domxref("RTCPeerConnection")}} is closed or the {{domxref("RTCRtpReceiver")}} is stopped.
- `TypeError`
  - : The value is being set to `stopped` when the current value is anything other than `stopped`.

