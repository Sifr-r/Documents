# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Assistive technologies generally render the value of `aria-valuenow` as a percent of a range between the value of `aria-valuemin` and `aria-valuemax`, unless [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext) is set. It is recommended to set the values for `aria-valuemin`, `aria-valuemax`, and `aria-valuenow` in a manner that is appropriate for this calculation.

> [!NOTE]
> An accessible name is **required**. If the `scrollbar` role is applied to an HTML {{HTMLElement('input')}} element (or `<meter>` or `<progress>` element), the accessible name can come from the associated {{HTMLElement('label')}}. Otherwise use [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) if a visible label is present or [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) if a visible label is not present.

