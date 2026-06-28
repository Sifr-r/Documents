# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Although the `options` object you can specify in the {{domxref("IntersectionObserver/IntersectionObserver","IntersectionObserver()")}} constructor has a field named `threshold`, this property is called `thresholds`.
> If you accidentally use `thresholds` as the name of the field in your `options`, the `thresholds` array will wind up being `[0.0]`, which is likely not what you expect.

