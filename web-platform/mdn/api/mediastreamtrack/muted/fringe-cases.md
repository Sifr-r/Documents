# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To implement a way for users to mute and unmute a track, use the
> {{domxref("MediaStreamTrack.enabled", "enabled")}} property. When a track is disabled
> by setting `enabled` to `false`, it generates only empty frames
> (audio frames in which every sample is 0, or video frames in which every pixel is
> black).

> [!NOTE]
> When possible, avoid polling `muted` to monitor the track's muting status.
> Instead, add event listeners for the {{domxref("MediaStreamTrack.mute_event", "mute")}} and {{domxref("MediaStreamTrack.unmute_event", "unmute")}} events.

