# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When an animation is cancelled, its {{domxref("Animation.startTime", "startTime")}} and {{domxref("Animation.currentTime", "currentTime")}} are set to `null`.

## Exceptions

This method doesn't directly throw exceptions; however, if the animation's {{domxref("Animation.playState", "playState")}} is anything but `"idle"` when cancelled, the {{domxref("Animation.finished", "current finished promise", "", 1)}} is rejected with a {{domxref("DOMException")}} named `AbortError`.

