# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When writing functions that process `popstate` event it is important to take into account that properties like `window.location` will already reflect the state change (if it affected the current URL), but `document` might still not. If the goal is to catch the moment when the new document state is already fully in place, a zero-delay {{domxref("Window.setTimeout", "setTimeout()")}} method call should be used to effectively put its inner _callback_ function that does the processing at the end of the browser event loop: `window.onpopstate = () => setTimeout(doSomeThing, 0);`

