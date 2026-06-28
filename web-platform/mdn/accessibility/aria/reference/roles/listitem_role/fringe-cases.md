# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If at all possible in your work, you should use the appropriate semantic HTML elements to mark up a list and its listitems — {{HTMLElement("ul")}}/{{HTMLElement("ol")}} and {{HTMLElement("li")}}. See [Best practices](#best_practices) for a full example.

> [!NOTE]
> The ARIA `list` / `listitem` roles don't distinguish between ordered and unordered lists.

> [!NOTE]
> Styling a list with `list-style: none;` in CSS removes the list semantics. Adding `role="listitem"` returns the semantics.

> [!NOTE]
> If you are marking up a list of items that will function as a tabbed interface, you should instead use the [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role), [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role), and [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role) roles.

