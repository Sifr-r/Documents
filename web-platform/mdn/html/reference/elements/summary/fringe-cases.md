# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The role assigned to the `<summary>` element varies across browsers. Some still assign it a default [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role) role, which removes all roles from its children. This inconsistency can cause issues for users of assistive technologies such as screen readers (`<h4>` in the previous example will have its role removed and will not be treated as a heading for these users). You should test your `<summary>` implementation on multiple platforms to ensure there's consistent accessibility support.

