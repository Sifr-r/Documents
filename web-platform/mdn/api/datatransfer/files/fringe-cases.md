# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `files` property of [`DataTransfer`](/en-US/docs/Web/API/DataTransfer) objects can only be accessed from within the {{domxref("HTMLElement/drop_event", "drop")}} and {{domxref("Element/paste_event", "paste")}} events. For all other events, the `files` property will be empty — because its underlying data store will be in a [protected mode](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store#protected_mode).

