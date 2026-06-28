# Fringe Cases

## Warnings & Notes

> [!NOTE]
> CSS scroll snapping is not mandatory to use the CSS carousel features. However, carousels work a lot better with scroll snapping included. Without scroll snapping, the scroll buttons and markers will be unlikely to navigate cleanly between pages, and the result will be substandard.

> [!NOTE]
> We also set a {{cssxref("cursor")}} value of `pointer` on the scroll buttons to make it more obvious that they can be interacted with (an improvement for both general [UX](/en-US/docs/Glossary/UX) and [cognitive accessibility](/en-US/docs/Web/Accessibility/Guides/Cognitive_accessibility)), unsetting it when the scroll buttons are `:disabled`.

> [!NOTE]
> User agents should automatically give an appropriate accessible name to generated scroll buttons so that assistive technologies can appropriately announced them and the buttons should have an implicit [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) of `button`. Providing [alternative text for generated content](/en-US/docs/Web/CSS/Reference/Properties/content#alternative_text_string_counter_attr) ensures the buttons have the {{glossary("accessible name", "accessible names")}} of "scroll left" and "scroll right" in user agents that don't natively include scroll button accessibility features.

> [!NOTE]
> Alternatively, a scroll marker group container can be created from an existing element containing a set of {{htmlelement("a")}} elements using {{cssxref("scroll-target-group")}}.

> [!NOTE]
> Generated content is inline by default; we can apply `width` and `height` to our scroll markers because they are being laid out as flex items.

> [!NOTE]
> When a scroll marker group container is created on a scroll container using the `scroll-marker-group` property, the scroll container is rendered with [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)/[`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role) semantics. You can <kbd>Tab</kbd> to it with the keyboard, then move between the different "pages" using the left and right (or up and down) cursor keys, which also changes the state of the associated scroll markers and scroll buttons as expected. The scroll markers can also be tabbed between normally, as expected.

> [!NOTE]
> There is currently no way to provide an accessible name for the scroll markers (there is no corresponding HTML element from which to draw a `data-` value as in the prior example). Using this pattern will create a WCAG SC [4.1.2 Name, Role, Value](https://www.w3.org/WAI/WCAG22/Understanding/name-role-value.html) violation.

