# Fringe Cases

## Warnings & Notes

> [!NOTE]
> For historical reasons, `onerror` on `Window` and {{domxref("WorkerGlobalScope")}} objects is the only event handler property that receives more than one argument.

    > [!NOTE]
    > In HTML, the [content event handler attribute](/en-US/docs/Web/HTML/Reference/Attributes#event_handler_attributes) `onerror` on the {{HTMLElement("body")}} element attaches `error` event listeners to `window` (_not_ the `<body>` element). For this event handler, the first parameter is called `event`, not `message`, although it still contains a string; that is, you would use `<body onerror="console.error(event)">` to log the error message.

> [!NOTE]
> These parameter names are observable with an [HTML event handler attribute](/en-US/docs/Web/HTML/Reference/Attributes#event_handler_attributes), where the first parameter is called `event` instead of `message`.

