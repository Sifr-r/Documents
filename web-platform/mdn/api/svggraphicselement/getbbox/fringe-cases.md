# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `getBBox()` must return the actual bounding box at
> the time the method was called—even in case the element has not yet been rendered. It
> also does not account for any transformation applied to the element or its parents.

> [!NOTE]
> `getBBox` returns different values than
> {{domxref("Element.getBoundingClientRect()", "getBoundingClientRect()")}}, as the
> latter returns value relative to the viewport

