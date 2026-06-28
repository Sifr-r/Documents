# Fringe Cases

## Warnings & Notes

> [!NOTE]
> [Radio buttons](/en-US/docs/Web/HTML/Reference/Elements/input/radio) are similar to checkboxes, but with an important distinction — [same-named radio buttons](/en-US/docs/Web/HTML/Reference/Elements/input/radio#defining_a_radio_group) are grouped into a set in which only one radio button can be selected at a time, whereas checkboxes allow you to turn single values on and off. Where multiple same-named controls exist, radio buttons allow one to be selected out of them all, whereas checkboxes allow multiple values to be selected.

> [!NOTE]
> If a checkbox is unchecked when its form is submitted, neither the name nor the value is submitted to the server. There is no HTML-only method of representing a checkbox's unchecked state (e.g., `value=unchecked`). If you wanted to submit a default value for the checkbox when it is unchecked, you could include JavaScript to create an {{HTMLElement("input/hidden", '&lt;input type="hidden"&gt;')}} within the form with a value indicating an unchecked state.

    > [!NOTE]
    > Unlike other input controls, a checkbox's value is only included in the submitted data if the checkbox is currently `checked`. If it is, then the value of the checkbox's `value` attribute is reported as the input's value, or `on` if no `value` is set.
    > Unlike other browsers, Firefox by default [persists the dynamic checked state](https://stackoverflow.com/questions/5985839/bug-with-firefox-disabled-attribute-of-input-not-resetting-when-refreshing) of an `<input>` across page loads. Use the [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete) attribute to control this feature.

    > [!NOTE]
    > This attribute allows user agents to expose `switch` ARIA semantics to assistive technologies — without requiring documents to explicitly specify `role="switch"`. The markup and API are similar to those of checkboxes, except that the `:indeterminate` pseudo-class never matches.

    > [!WARNING]
    > This attribute is still experimental and has limited browser support. The attribute is ignored on unsupported browsers.

> [!NOTE]
> While only some browsers render the checkbox as a switch, the behavior is the same across all browsers.

> [!NOTE]
> This is purely a visual change. It has no impact on whether the checkbox's `value` is used in a form submission. That is decided by the `checked` state, regardless of the `indeterminate` state.

