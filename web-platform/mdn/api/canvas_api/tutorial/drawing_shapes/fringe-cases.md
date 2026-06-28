# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `image-rendering: pixelated` is not without its problems as a crisp-edge-preservation technique. When CSS pixels don't align with device pixels (if the {{domxref("Window/devicePixelRatio", "devicePixelRatio")}} is not an integer), certain pixels may be drawn larger than others, resulting in a non-uniform appearance. This is not an easy problem to solve, however, because it is impossible to fill device pixels precisely when the CSS pixels cannot accurately map to them.

> [!NOTE]
> Be aware that in our vertical line example, the Y position still referenced an integer grid line position—if it hadn't, we would see pixels with half coverage at the endpoints.

> [!NOTE]
> When the current path is empty, such as immediately after calling `beginPath()`, or on a newly created canvas, the first path construction command is always treated as a `moveTo()`, regardless of what it actually is. For that reason, you will almost always want to specifically set your starting position after resetting a path.

> [!NOTE]
> When you call `fill()`, any open shapes are closed automatically, so you don't have to call `closePath()`. This is **not** the case when you call `stroke()`.

> [!NOTE]
> To learn more about the `arc()` function, see the [Arcs](#arcs) section below.

> [!NOTE]
> Angles in the `arc` function are measured in radians, not degrees. To convert degrees to radians you can use the following JavaScript expression: `radians = (Math.PI/180)*degrees`.

> [!NOTE]
> This example requires a slightly larger canvas than the others on this page: 150 x 200 pixels.

