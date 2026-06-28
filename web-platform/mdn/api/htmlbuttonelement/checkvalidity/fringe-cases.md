# Fringe Cases

## Warnings & Notes

> [!NOTE]
> An HTML {{htmlelement("button")}} element of the `"submit"` type with a non-null {{domxref("HTMLButtonElement.validationMessage", "validationMessage")}} is considered invalid, will match the CSS {{cssxref(":invalid")}} pseudo-class, and will cause `checkValidity()` to return false. Use the {{domxref("HTMLButtonElement.setCustomValidity()")}} method to set the {{domxref("HTMLButtonElement.validationMessage")}} to the empty string to set the {{domxref("HTMLButtonElement.validity", "validity")}} state to be valid.

