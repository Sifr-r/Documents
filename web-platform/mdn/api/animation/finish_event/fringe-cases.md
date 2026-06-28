# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `"paused"` play state supersedes the `"finished"` play
> state; if the animation is both paused and finished, the `"paused"` state
> is the one that will be reported. You can force the animation into the
> `"finished"` state by setting its {{domxref("Animation.startTime", "startTime")}} to
> `document.timeline.currentTime - (Animation.currentTime * Animation.playbackRate)`.

