# Fringe Cases

## Warnings & Notes

> [!NOTE]
> While in American English, "labeled" is spelled with one "l", the "labelledby" spelling has been established and is the spelling used in accessibility APIs.

> [!NOTE]
> {{htmlelement("span")}} elements have the [`generic` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role) by default, and can't use `aria-labelledby` unless they also specify a role that can provide an accessible name.
> Here we do that with `role="checkbox"`.

> [!WARNING]
> Because calculating the name of an element with `aria-labelledby` can be complex and reference hidden content, testing with assistive technologies to ensure the expected name is presented to users is very important.

