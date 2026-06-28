# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In the current specification, `requestPointerLock()` only communicates the success or failure of the request by firing {{domxref("Document/pointerlockchange_event", "pointerlockchange")}} or {{domxref("Document/pointerlockerror_event", "pointerlockerror")}} events. [A proposed update to the specification](https://github.com/w3c/pointerlock/pull/49) updates `requestPointerLock()` to return a {{jsxref("Promise")}} which communicates success or failure. This page documents the version that returns a {{jsxref("Promise")}}. However, note that this version is not yet a standard and is not implemented by all browsers. See [Browser compatibility](#browser_compatibility) for more information.

## Security Notes

{{Glossary("Transient activation")}} is required when calling `requestPointerLock()`. The user has to interact with the page or a UI element in order for this feature to work. Also, the target element's associated document must be in the active state.

If calling `requestPointerLock()` immediately after releasing the pointer lock via the default unlock gesture (instead of through an `exitPointerLock()` call), the call will fail, even if a {{Glossary("transient activation")}} is available.

If calling `requestPointerLock()` with {{domxref("Element.requestFullscreen()", "requestFullscreen()")}}, the `requestPointerLock()` must be called first, because the {{domxref("Element.requestFullscreen()", "requestFullscreen()")}} will consume the state of {{Glossary("Transient activation", "transient activation")}}.

The `allow-pointer-lock` [sandbox token](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) must be added when calling `requestPointerLock()` in an {{htmlelement("iframe")}} element. Also, no other elements in other {{htmlelement("iframe")}} elements may be in pointer lock mode.

