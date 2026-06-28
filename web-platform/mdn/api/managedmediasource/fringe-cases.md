# Fringe Cases

## Warnings & Notes

> [!NOTE]
> On Safari, `ManagedMediaSource` only activates when remote playback is explicitly disabled on the media element (by setting {{domxref("HTMLMediaElement.disableRemotePlayback")}} to `true`), or when an AirPlay source alternative is provided (for example, an HLS {{htmlelement("source")}} element). Without either of these, the {{domxref("MediaSource.sourceopen_event", "sourceopen")}} event will not fire.

