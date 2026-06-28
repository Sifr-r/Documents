# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Unlike the {{htmlelement("meter")}} element, the minimum value is always 0, and the `min` attribute is not allowed for the `<progress>` element.

> [!NOTE]
> The {{cssxref(":indeterminate")}} pseudo-class can be used to match against indeterminate progress bars. To change the progress bar to indeterminate after giving it a value you must remove the value attribute with {{domxref("Element.removeAttribute", "element.removeAttribute('value')")}}.

> [!NOTE]
> Text placed between the element's tags is not an accessible label, it is only recommended as a fallback for old browsers that do not support this element.

