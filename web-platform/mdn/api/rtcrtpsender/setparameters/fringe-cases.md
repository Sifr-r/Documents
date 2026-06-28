# Fringe Cases

## Exceptions

If an error occurs, the returned promise is rejected with the appropriate exception from the list below.

- `InvalidModificationError` {{domxref("DOMException")}}
  - : Returned if one of the following problems is detected:
    - The number of encodings specified in the `parameters` object's `encodings` property does not match the number of encodings currently listed for the `RTCRtpSender`.
      You cannot change the number of encoding options after the sender has been created.
    - The order of the specified `encodings` has changed from the current list's order.
    - An attempt has been made to alter a property that cannot be changed after the sender is first created.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the transceiver, of which the `RTCRtpSender` is a part, is not running or has no parameters to set.
- `OperationError` {{domxref("DOMException")}}
  - : Returned if an error occurs that does not match the ones specified here.
- {{jsxref("RangeError")}}
  - : Returned if the value specified for `scaleResolutionDownBy` option is less than 1.0 — which would result in scaling up rather than down, which is not allowed; or if one or more of the specified `encodings` [`maxFramerate`](#maxframerate) values is less than 0.0.

In addition, if a WebRTC error occurs while configuring or accessing the media, an {{domxref("RTCError")}} is thrown with its {{domxref("RTCError.errorDetail", "errorDetail")}} set to `hardware-encoder-error`.

