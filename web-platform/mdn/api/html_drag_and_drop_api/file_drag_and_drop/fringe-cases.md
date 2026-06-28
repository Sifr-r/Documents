# Fringe Cases

## Warnings & Notes

> [!NOTE]
> {{domxref("HTMLElement/dragstart_event", "dragstart")}} and {{domxref("HTMLElement/dragend_event", "dragend")}} events are not fired when dragging a file into the browser from the OS. To detect when OS files are dragged into the browser, use {{domxref("HTMLElement/dragenter_event", "dragenter")}} and {{domxref("HTMLElement/dragleave_event", "dragleave")}}.
> This means that it is not possible to use {{domxref("DataTransfer.setDragImage","setDragImage()")}} to apply a custom drag image/cursor overlay when dragging files from the OS — because the drag data store can only be modified in the {{domxref("HTMLElement/dragstart_event", "dragstart")}} event. This also applies to {{domxref("DataTransfer.setData","setData()")}}.

