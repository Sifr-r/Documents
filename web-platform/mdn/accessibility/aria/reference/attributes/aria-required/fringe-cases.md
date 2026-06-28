# Fringe Cases

## Warnings & Notes

> [!NOTE]
> ARIA only modifies the accessibility tree, modifying how assistive technology presents content to users. ARIA does not change anything about an element's function or behavior. When not using semantic HTML elements for their intended purpose and default functionality, you must use JavaScript to manage behavior, focus, and ARIA states.

> [!NOTE]
> Which elements are required should be apparent to all users. Ensure the visual presentation indicates the form control is required in a consistent, visible manner, remembering that color is not enough to convey information.

> [!NOTE]
> If the field's label already contains the word "required", it is recommended to leave out the `aria-required` attribute. This avoids that screen readers read out the term "required" twice.

