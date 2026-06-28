# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The observer [callback](/en-US/docs/Web/API/IntersectionObserver/IntersectionObserver#callback) will always fire the first render cycle after `observe()` is called, even if the observed element has not yet moved with respect to the viewport.
> This means that, for example, an element that is outside the viewport when `observe()` is called on it will result in the callback being immediately called with at least one [entry](/en-US/docs/Web/API/IntersectionObserverEntry) with [`intersecting`](/en-US/docs/Web/API/IntersectionObserverEntry/isIntersecting) set to `false`.
> An element inside the viewport will result in the callback being immediately called with at least one entry with `intersecting` set to `true`.

