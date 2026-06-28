# Fringe Cases

## Warnings & Notes

> [!NOTE]
> [Checkboxes](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) are similar to radio buttons, but with an important distinction: radio buttons are designed for selecting one value out of a set, whereas checkboxes let you turn individual values on and off. Where multiple controls exist, radio buttons allow one to be selected out of them all, whereas checkboxes allow multiple values to be selected.

> [!NOTE]
> If no radio button is selected when the form is submitted, the radio group is not included in the submitted form data at all, since there is no value to report.

> [!NOTE]
> If you put the `checked` attribute on more than one radio button, later instances will override earlier ones; that is, the last `checked` radio button will be the one that is selected. This is because only one radio button in a group can ever be selected at once, and the user agent automatically deselects others each time a new one is marked as checked.

> [!NOTE]
> If you wish to use the {{cssxref("appearance")}} property, you should test it very carefully. Although it is supported in most modern browsers, its implementation varies widely. In older browsers, even the keyword `none` does not have the same effect across different browsers, and some do not support it at all. The differences are smaller in the newest browsers.

