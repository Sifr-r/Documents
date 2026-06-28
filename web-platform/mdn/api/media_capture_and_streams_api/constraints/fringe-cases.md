# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Constraints which are specified using any or all of `max`, `min`, or `exact` are always treated as mandatory. If any constraint which uses one or more of those can't be met when calling `applyConstraints()`, the promise will be rejected.

> [!NOTE]
> You can specify one or more media input device IDs to establish restrictions on which input sources are allowed. To collect a list of the available devices, you can call {{domxref("MediaDevices.enumerateDevices", "navigator.mediaDevices.enumerateDevices()")}}, then for each device which meets the desired criteria, add its `deviceId` to the `MediaConstraints` object that eventually gets passed into `getUserMedia()`.

> [!NOTE]
> Of course, there may be non-standard properties in this list, in which case you probably will find that the documentation link doesn't help much.

