# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You cannot set [`monitorTypeSurfaces: "exclude"`](/en-US/docs/Web/API/MediaDevices/getDisplayMedia#monitortypesurfaces) at the same time as `displaySurface: "monitor"` as the two settings are contradictory. Trying to do so will result in the associated `getDisplayMedia()` call failing with a `TypeError`.

