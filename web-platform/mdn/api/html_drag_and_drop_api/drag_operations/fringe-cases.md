# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `dragleave` always fires _after_ `dragenter`, so conceptually, in between these two events, the target has entered a new element but has not exited the previous one yet.

> [!NOTE]
> The spec requires the `dragenter` event to be cancelled too for a drop target, otherwise the `dragover` or `dragleave` events won't even start firing on this element; in practice no browser implements this, and the "current element" changes every time a new element is entered.

> [!NOTE]
> The spec requires that cancelling the `drag` event [aborts](#a_failed_drop) the drag; in practice no browser implements this. See example below:
>
> {{EmbedLiveSample("cancel_drag", "", 100)}}

