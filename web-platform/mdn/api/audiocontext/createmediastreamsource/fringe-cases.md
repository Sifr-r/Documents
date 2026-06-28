# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can see this [example running live](https://mdn.github.io/webaudio-examples/stream-source-buffer/), or [view the source](https://github.com/mdn/webaudio-examples/tree/main/stream-source-buffer).

> [!NOTE]
> As a consequence of calling
> `createMediaStreamSource()`, audio playback from the media stream will
> be re-routed into the processing graph of the {{domxref("AudioContext")}}. So
> playing/pausing the stream can still be done through the media element API and the
> player controls.

