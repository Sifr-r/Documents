# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Up to Firefox 148, `structuredClone.call(iframe.contentWindow)` incorrectly created objects in the caller's [realm](/en-US/docs/Web/JavaScript/Reference/Execution_model#realms) instead of the iframe's realm. In Firefox 149, the implementation changed to instantiate objects in the `this` realm, so the method's behavior more closely matches the specification.
>
> Across all browsers, a direct call `structuredClone(value)` clones values in the caller's realm. From Firefox 149, [web extension content scripts](/en-US/docs/Mozilla/Add-ons/WebExtensions/Content_scripts) can call `window.structuredClone(value)` to clone values in the page's realm and `globalThis.structuredClone(value)` to clone into the realm of the content script. For more information, see [`structuredClone` in content scripts](/en-US/docs/Mozilla/Add-ons/WebExtensions/Sharing_objects_with_page_scripts#structuredclone).

> [!NOTE]
> A scenario where this might be useful is when asynchronously validating some data in a buffer before saving it.
> To avoid the buffer being modified before the data is saved, you can clone the buffer and validate that data.
> If you also _transfer_ the data, any attempts to modify the original buffer will fail, preventing its accidental misuse.

## Exceptions

- `DataCloneError` {{domxref("DOMException")}}
  - : Thrown if any part of the input value is not serializable.

