# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Canvas content is not accessible to screen readers. If the canvas is purely decorative, include `role="presentation"` on the `<canvas>` opening tag. Otherwise, include descriptive text as the value of the [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) attribute directly on the canvas element itself or include fallback content placed within the opening and closing canvas tag. Canvas content is not part of the DOM, but nested fallback content is.

> [!NOTE]
> When you set the `strokeStyle` and/or `fillStyle` property, the new value becomes the default for all shapes being drawn from then on. For every shape you want in a different color, you will need to reassign the `fillStyle` or `strokeStyle` property.

> [!NOTE]
> If you are wondering about the lines appearing gray near the edge instead of black, check the [Seeing blurry edges?](/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes#seeing_blurry_edges) section in the previous chapter.

> [!NOTE]
> Like with the `drawImage()` method, you must make sure the image you use is loaded before calling this method or the pattern may be drawn incorrectly.

> [!NOTE]
> Shadows are only drawn for `source-over` [compositing operations](/en-US/docs/Web/API/Canvas_API/Tutorial/Compositing).

