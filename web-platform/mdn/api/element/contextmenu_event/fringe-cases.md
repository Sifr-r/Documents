# Fringe Cases

## Warnings & Notes

> [!NOTE]
> An exception to this in Firefox: if the user holds down the <kbd>Shift</kbd> key while right-clicking, then the context menu will be shown without a `contextmenu` event being fired.

> [!NOTE]
> In earlier versions of the specification, the event type for this event was a {{domxref("MouseEvent")}}. Check [browser compatibility](#browser_compatibility) for more information.

> [!NOTE]
> In Firefox, if you hold down the <kbd>Shift</kbd> key while right-clicking, then the context menu is shown without the `contextmenu` event being fired. Therefore, canceling the event does not stop the context menu from being shown.

