# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Relying on the `window["id-value"]` or `window.idValue` pattern is dangerous and discouraged because it can lead to unexpected conflicts with existing or future APIs in the browser.
> For example, if a browser introduces a built-in global property named `preamble` in the future, your code may no longer be able to access the HTML element.
> To avoid such conflicts, always use the {{domxref("Document.getElementById()")}} or {{domxref("Document.querySelector()")}} method to access elements by ID.

