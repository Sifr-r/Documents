# Fringe Cases

## Exceptions

If the returned promise is rejected, one of the following exceptions is provided to the
rejection handler:

- `InvalidModificationError` {{domxref("DOMException")}}
  - : Returned if replacing the `RTCRtpSender`'s current track with the new one
    would require negotiation.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Returned if the track on which this method was called is stopped rather than running.
- {{jsxref("TypeError")}}
  - : Returned if the new track's `kind` doesn't match the original track.

