# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Setting the `popover` attribute with no value is equivalent to setting `popover="auto"`.

> [!NOTE]
> If the `popovertargetaction` attribute is omitted, `"toggle"` is the default action that will be performed by a control button.

> [!NOTE]
> `popover="auto"` popovers are also dismissed by successful {{domxref("HTMLDialogElement.showModal()")}} and {{domxref("Element.requestFullscreen()")}} calls on other elements in the document. Bear in mind however that calling these methods on a shown popover will result in failure because those behaviors don't make sense on an already-shown popover. You can however call them on an element with the `popover` attribute that isn't currently being shown.

> [!NOTE]
> You _can_ use `hint` popovers alongside `manual` popovers, although there is not really much of a reason to. They are designed to circumvent some of the limitations of `auto` popovers, enabling use cases like the one detailed in this section.
>
> Note also that `popover="hint"` falls back to `popover="manual"` in unsupporting browsers.

> [!NOTE]
> There is a related feature — **interest invokers** — that can be used to create hover/focus popover functionality conveniently and consistently, without requiring JavaScript. Check out [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) to learn more.

> [!NOTE]
> In the demo [source code](https://github.com/mdn/dom-examples/tree/main/popover-api/popover-hint), the tooltips are nested inside the popover control buttons. This is because it provides a better fallback in browsers that don't support CSS anchor positioning — the `hint` popovers appear next to their associated control buttons rather than somewhere else entirely.

> [!NOTE]
> For an example that uses this implicit association, see our [popover hint demo](https://mdn.github.io/dom-examples/popover-api/popover-hint/) ([source](https://github.com/mdn/dom-examples/tree/main/popover-api/popover-hint)). If you check out the CSS code, you'll see that no explicit anchor associations are made using the {{cssxref("anchor-name")}} and {{cssxref("position-anchor")}} properties.

> [!NOTE]
> If you want to remove the implicit anchor reference to stop the popover from being anchored to its invoker, you can do so by setting the `position-anchor` property of the popover to an anchor name that doesn't exist in the current document, such as `--not-an-anchor-name`. See also [removing an anchor association](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#removing_an_anchor_association).

> [!NOTE]
> When animating using [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions), [`transition-behavior: allow-discrete`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior) needs to be set to enable the above behavior. When animating with [CSS animations](/en-US/docs/Web/CSS/Guides/Animations), the above behavior is available by default; an equivalent step is not required.

> [!NOTE]
> Because popovers change from `display: none` to `display: block` each time they are shown, the popover transitions from its `@starting-style` styles to its `[popover]:popover-open` styles every time the entry transition occurs. When the popover closes, it transitions from its `[popover]:popover-open` state to the default `[popover]` state.
>
> It is possible for the style transition on entry and exit to be different in such cases. See our [Demonstration of when starting styles are used](/en-US/docs/Web/CSS/Reference/At-rules/@starting-style#demonstration_of_when_starting_styles_are_used) example for a proof of this.

