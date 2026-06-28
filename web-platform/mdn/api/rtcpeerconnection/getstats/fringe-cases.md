# Fringe Cases

## Exceptions

This method does not throw exceptions; instead, it rejects the returned promise with one of the following errors:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown when there is no {{domxref("RTCRtpSender")}} or {{domxref("RTCRtpReceiver")}} whose `track` matches the specified `selector`, or
    `selector` matches more than one sender or receiver.

