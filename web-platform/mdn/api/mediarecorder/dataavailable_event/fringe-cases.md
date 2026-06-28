# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Like other time values in web APIs, `timeslice` is not exact and the real intervals may be delayed due to other pending tasks, browser features (pausing the camera and microphone in Safari), browser-specific behaviors (locking the screen while recording on Chrome on Android pauses the `dataavailable` event), or other browser bugs. Such scenarios can also lead to significantly larger chunks.
>
> Therefore, don't rely on `timeslice` and the number of chunks received to calculate the time elapsed, because errors may accumulate. Instead, keep a separate timer using {{domxref("Event.timeStamp")}} or similar, that records the total time elapsed since starting.

