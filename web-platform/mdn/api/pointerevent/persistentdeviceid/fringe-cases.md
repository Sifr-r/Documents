# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Due to digitizer and pointing device hardware constraints, a `persistentDeviceId` may not be available for all pointer events, particularly with older hardware.
> For example, the pointing device might not report its hardware ID to the digitizer in time for `pointerdown` to receive a `persistentDeviceId`: it may initially be `0` and change to a valid value for later events in the stroke.

