# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Another way to create a
> `MediaStreamAudioSourceNode` is to call
> the {{domxref("AudioContext.createMediaStreamSource()")}} method, specifying the stream
> from which you want to obtain audio.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the specified {{domxref("MediaStream")}} does not contain any audio tracks.

