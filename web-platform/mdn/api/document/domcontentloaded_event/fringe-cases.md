# Fringe Cases

## Warnings & Notes

> [!NOTE]
> There is no `onDOMContentLoaded` event handler property for this event.

> [!NOTE]
> There's no race condition here — it's not possible for the document to be loaded between the `if` check and the `addEventListener()` call. JavaScript has run-to-completion semantics, which means if the document is loading at one particular tick of the event loop, it can't become loaded until the next cycle, at which time the `doSomething` handler is already attached and will be fired.

> [!NOTE]
> `document.readyState` is set to `"interactive"` after the completion of the HTML parser but before the execution of scripts with `defer` or `type="module"`. `DOMContentLoaded` is fired after the execution of these scripts, but before the execution of scripts with `async`. `document.readyState` is set to `"complete"` after the execution of async scripts. This means that during the execution of deferred and module scripts, `document.readyState` is `"interactive"` but it's still possible to attach `DOMContentLoaded` listeners and make them fire as usual. In practice, executing `doSomething()` a little earlier is fine unless it relies on some global state set up by other deferred/module scripts.

