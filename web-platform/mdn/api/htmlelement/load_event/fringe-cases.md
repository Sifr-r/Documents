# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `load` event on {{domxref("HTMLBodyElement#event_handlers", "HTMLBodyElement")}} is actually an alias for the {{domxref("Window/load_event", "window.onload")}} event. Therefore, the `load` event will only fire on the `<body>` element once all of the document's resources have loaded or errored. However, for the sake of clarity, it is recommended that the event handler is attached to the `window` object directly rather than on `HTMLBodyElement`.

