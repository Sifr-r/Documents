# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When you specify multiple comma-separated values on an `animation-*` property, they are applied to the animations in the order in which the {{cssxref("animation-name")}}s appear. For situations where the number of animations and `animation-*` property values do not match, see [Setting multiple animation property values](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

> [!NOTE]
> When creating [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), specifying an `animation-iteration-count` causes the animation to repeat that number of times over the course of the timeline's progression. If an `animation-iteration-count` is not provided, the animation will only occur once. `infinite` is a valid value for scroll-driven animations, but it results in an animation that doesn't work.

