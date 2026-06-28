# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `dragstart`, `drag`, and `dragend` events are fired on the dragged item, and therefore can't fire when dragging a file into the browser from the OS.
>
> Similarly, the `dragenter`, `dragleave`, `dragover`, and `drop` events are fired on elements that are potential drop targets, and therefore can't fire when dragging an item out of the browser.

> [!NOTE]
> When an element is made draggable, text or other elements within it can no longer be selected in the normal way by clicking and dragging with the mouse. Instead, the user must hold down the <kbd>Alt</kbd> key to select text with the mouse, or use the keyboard.

