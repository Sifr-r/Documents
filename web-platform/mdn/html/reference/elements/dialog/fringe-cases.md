# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The `tabindex` attribute must not be used on the `<dialog>` element. See [Additional notes](#additional_notes).

    > [!NOTE]
    > While you can toggle between the open and closed states of non-modal dialog boxes by toggling the presence of the `open` attribute, this approach is not recommended. See {{domxref("HTMLDialogElement.open", "open")}} for more information.

> [!NOTE]
> Reload the page to reset the output.

> [!NOTE]
> When animating using [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions), [`transition-behavior: allow-discrete`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior) needs to be set to enable the above behavior. This behavior is available by default when animating with [CSS animations](/en-US/docs/Web/CSS/Guides/Animations); an equivalent step is not required.

> [!NOTE]
> In browsers that don't support the {{cssxref(":open")}} pseudo-class, you can use the attribute selector `dialog[open]` to style the `<dialog>` element when it is in the open state.

> [!NOTE]
> Because `<dialog>`s change from `display: none` to `display: block` each time they are shown, the `<dialog>` transitions from its `@starting-style` styles to its `dialog:open` styles every time the entry transition occurs. When the `<dialog>` closes, it transitions from its `dialog:open` state to the default `dialog` state.
>
> It is possible for the style transition on entry and exit to be different in such cases. See our [Demonstration of when starting styles are used](/en-US/docs/Web/CSS/Reference/At-rules/@starting-style#demonstration_of_when_starting_styles_are_used) example for a proof of this.

