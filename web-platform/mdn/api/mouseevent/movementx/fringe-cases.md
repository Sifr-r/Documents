# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Browsers [use different units for `movementX` and `screenX`](https://github.com/w3c/pointerlock/issues/42) than what the specification defines.
> Depending on the browser and operating system, the `movementX` units may be a physical pixel, a logical pixel, or a CSS pixel. You may want to avoid the movement properties, and instead calculate the delta between the current client values ({{domxref("MouseEvent.screenX", "screenX")}}, {{domxref("MouseEvent.screenY", "screenY")}}) and the previous client values.

