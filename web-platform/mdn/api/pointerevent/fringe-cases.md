# Fringe Cases

## Warnings & Notes

> [!NOTE]
> It's important to note that in many cases, both pointer and mouse events get sent (in order to let non-pointer-specific code still interact with the user). If you use pointer events, you should call {{domxref("Event.preventDefault()", "preventDefault()")}} to keep the mouse event from being sent as well.

    > [!NOTE]
    > For touchscreen browsers that allow [direct manipulation](https://w3c.github.io/pointerevents/#dfn-direct-manipulation), a `pointerdown` event triggers [implicit pointer capture](https://w3c.github.io/pointerevents/#dfn-implicit-pointer-capture), which causes the target to capture all subsequent pointer events as if they were occurring over the capturing target. Accordingly, `pointerover`, `pointerenter`, `pointerleave`, and `pointerout` **will not fire** as long as this capture is set. The capture can be released manually by calling {{ domxref('element.releasePointerCapture') }} on the target element, or it will be implicitly released after a `pointerup` or `pointercancel` event.

