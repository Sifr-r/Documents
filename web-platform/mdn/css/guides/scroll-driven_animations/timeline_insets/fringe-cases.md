# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `animation-timeline` property should always come after any `animation` shorthand declarations. While the shorthand property can't be used to set the `animation-timeline` property, it does reset the timeline to the default time-based document timeline.

> [!NOTE]
> In all the examples, the {{glossary("scroll container")}} is `250px` tall and we are using the default values for {{cssxref("animation-iteration-count")}} (`1`), {{cssxref("animation-delay")}} (`0s`), and {{cssxref("animation-direction")}} (`normal`). We set the {{cssxref("animation-timing-function")}} to `step-end` and the {{cssxref("animation-fill-mode")}} is to `forward` to make the it more apparent when the animation iteration has not yet started, when it is active, and when it is complete. See the [Using CSS animations guide](/en-US/docs/Web/CSS/Guides/Animations/Using) to learn more.

