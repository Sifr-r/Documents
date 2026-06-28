# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The attribute is supported only on a few roles. For example, `dialog`s do not support `aria-activedescendant`. When a combobox opens a dialog, DOM focus moves into the dialog from the combobox as it is not referenceable with this attribute.

> [!NOTE]
> When a descendant of a `listbox`, `grid`, or `tree` popup is focused, DOM focus remains on the combobox and the combobox has `aria-activedescendant` set to a value that refers to the focused element within the popup.

