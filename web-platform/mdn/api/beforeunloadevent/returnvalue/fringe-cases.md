# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `returnValue` is a legacy feature, and best practice is to trigger the dialog by invoking {{domxref("Event.preventDefault()")}} on the `BeforeUnloadEvent` object, while also setting `returnValue` to support legacy cases. See the {{domxref("Window/beforeunload_event", "beforeunload")}} event reference for detailed up-to-date guidance.

> [!NOTE]
> A generic browser-specified string is displayed in the dialog. This cannot be controlled by the webpage code.

