# Fringe Cases

## Warnings & Notes

> [!NOTE]
> An HTML {{htmlelement("textarea")}} element with a non-null {{domxref("HTMLTextAreaElement.validationMessage", "validationMessage")}} is considered invalid, will match the CSS {{cssxref(":invalid")}} pseudo-class, and will cause `checkValidity()` to return false. Use the {{domxref("HTMLTextAreaElement.setCustomValidity()")}} method to set the {{domxref("HTMLTextAreaElement.validationMessage")}} to the empty string to set the {{domxref("HTMLTextAreaElement.validity", "validity")}} state to be valid.

