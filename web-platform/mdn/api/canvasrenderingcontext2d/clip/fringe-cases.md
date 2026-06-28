# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Be aware that the clipping region is only constructed from
> shapes added to the path. It doesn't work with shape primitives drawn directly to the
> canvas, such as {{domxref("CanvasRenderingContext2D.fillRect()","fillRect()")}}.
> Instead, you'd have to use {{domxref("CanvasRenderingContext2D.rect()","rect()")}} to
> add a rectangular shape to the path before calling `clip()`.

> [!NOTE]
> Clip paths cannot be reverted directly. You must save your canvas state using {{domxref("CanvasRenderingContext2D/save", "save()")}} before calling `clip()`, and restore it once you have finished drawing in the clipped area using {{domxref("CanvasRenderingContext2D/restore", "restore()")}}.

