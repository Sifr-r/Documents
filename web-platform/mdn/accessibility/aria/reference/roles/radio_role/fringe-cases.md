# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The first rule of ARIA is if a native HTML element or attribute has the semantics and behavior you require, use it instead of re-purposing an element and adding ARIA. Instead use the native [HTML `<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio) (with an associated {{HTMLElement('label')}}), which natively provides all the functionality required:

> [!NOTE]
> Use the [`tabindex` attribute](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) if the `role="radio"` is used on an element that does not natively accept keyboard focus. E.g., a `<div>` or `<span>`.

