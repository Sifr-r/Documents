# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When transitioning `overlay`, you need to set [`transition-behavior: allow-discrete`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior) on the transition so that it will animate. `overlay` animations differ from normal [discrete animations](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete) in that the visible (i.e., `auto`) state will always be shown for the full duration of the transition, regardless of whether it is the start or end state.

> [!NOTE]
> Because popovers change from `display: none` to `display: block` each time they are shown, the popover transitions from its `@starting-style` styles to its `[popover]:popover-open` styles every time the entry transition occurs. When the popover closes, it transitions from its `[popover]:popover-open` state to the default `[popover]` state.
>
> It is possible for the style transition on entry and exit to be different in such cases. See our [Demonstration of when starting styles are used](/en-US/docs/Web/CSS/Reference/At-rules/@starting-style#demonstration_of_when_starting_styles_are_used) example for a proof of this.

