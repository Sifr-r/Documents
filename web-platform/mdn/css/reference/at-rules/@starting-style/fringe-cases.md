# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `@starting-style` is only relevant to CSS transitions. When using [CSS animations](/en-US/docs/Web/CSS/Guides/Animations) to implement such effects, `@starting-style` is not needed. See [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using) for an example.

> [!NOTE]
> The `@starting-style` at-rule and the "original rule" have the same [specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity). To ensure that starting styles get applied, include the `@starting-style` at-rule _after_ the "original rule". If you specify the `@starting-style` at-rule before the "original rule", the original styles will override the starting styles.

> [!NOTE]
> We've also included a transition on the {{cssxref("::backdrop")}} that appears behind the popover when it opens, to provide a nice darkening animation. `[popover]:popover-open::backdrop` is used to select the backdrop when the popover is open.

> [!NOTE]
> Because popovers change from `display: none` to `display: block` each time they are shown, the popover transitions from its `@starting-style` styles to its `[popover]:popover-open` styles every time the entry transition occurs. When the popover closes, it transitions from its `[popover]:popover-open` state to the default `[popover]` state.

> [!NOTE]
> You can find an example that demonstrates transitioning a {{htmlelement("dialog")}} element and its backdrop as it is shown and hidden on the `<dialog>` reference page — see [Transitioning dialog elements](/en-US/docs/Web/HTML/Reference/Elements/dialog#transitioning_dialog_elements).

