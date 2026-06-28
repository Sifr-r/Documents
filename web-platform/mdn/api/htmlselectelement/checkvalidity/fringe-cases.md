# Fringe Cases

## Warnings & Notes

> [!NOTE]
> An HTML {{htmlelement("select")}} element with a non-null {{domxref("HTMLSelectElement.validationMessage", "validationMessage")}} is considered invalid, will match the CSS {{cssxref(":invalid")}} pseudo-class, and will cause `checkValidity()` to return false. Use the {{domxref("HTMLSelectElement.setCustomValidity()")}} method to set the {{domxref("HTMLSelectElement.validationMessage")}} to the empty string to set the {{domxref("HTMLSelectElement.validity", "validity")}} state to be valid.

