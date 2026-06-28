# Fringe Cases

## Warnings & Notes

> [!NOTE]
> _Pointer capture_ is different from [_pointer lock_](/en-US/docs/Web/API/Pointer_Lock_API), which physically prevents the pointer from leaving a region.

> [!NOTE]
> The `button` property indicates a change in the state of the button. However, as in the case of touch, when multiple events occur with one event, all of them have the same value.

> [!NOTE]
> If you need to move an element in the DOM, then make sure to call `setPointerCapture()` **after DOM movements** so that `setPointerCapture()` will not lose track of it. E.g., if you need to use `Element.append()` to move an element somewhere else, then make sure to call `setPointerCapture()` on it only after the call to `Element.append()`.

