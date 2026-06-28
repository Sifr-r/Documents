# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Sending multiple streams (RID) at a time is called "simulcast".
> This feature provides a [middlebox](https://en.wikipedia.org/wiki/Middlebox) with the same stream in multiple levels of video quality, allowing it to manage bandwidth by selectively transmitting appropriate levels to participants and switch resolution rapidly on the fly (i.e., switching to forward low-quality video for everyone except the active speaker).
> The recipient only ever gets one stream, which is why the comparable receiver method {{domxref("RTCRtpScriptTransformer.sendKeyFrameRequest()")}} does not require that an RID is specified.

## Exceptions

- `InvalidStateError`
  - : The encoder is not processing video frames, or is `undefined`.
- `TypeError`
  - : The provided `rid` but does not conform to the grammar requirements.
- `NotFoundError`
  - : There are no video encoders. This might be raised if the corresponding `RTCRtpSender` is not active or its track is ended.

