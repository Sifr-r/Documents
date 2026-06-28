# Fringe Cases

## Warnings & Notes

> [!NOTE]
> While there are ways to build tab-like functionality without JavaScript, there is no substitute combination using only HTML and CSS that will provide the same set of functionality that's required above for accessible tabs with content.

> [!NOTE]
> Setting `tabindex` on the tab panel is unnecessary if the first element in the tab panel is focusable (such as a link), because tabbing to the link will also start reading the panel's content. However, if there are any panels in the set whose first content element is not focusable, then all tabpanel elements in a tab set should be focusable, so that screen reader users can navigate to the panel content consistently.

