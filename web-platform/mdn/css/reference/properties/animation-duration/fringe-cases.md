# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Negative values are invalid, causing the declaration to be ignored. Some early, prefixed, implementations may consider them as identical to `0s`.

> [!NOTE]
> When you specify multiple comma-separated values on an `animation-*` property, they are applied to the animations in the order in which the {{cssxref("animation-name")}}s appear. For situations where the number of animations and `animation-*` property values do not match, see [Setting multiple animation property values](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

> [!NOTE]
> When creating [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), specifying an `animation-duration` value in seconds or milliseconds doesn't really make sense. In tests, it seemed to have no effect on scroll progress timeline animations, while on view progress timeline animations it seemed to push the animation to happen nearer the end of the timeline. However, Firefox requires an `animation-duration` to be set for it to successfully apply the animation. You are therefore advised to set `animation-duration` to `1ms` so that animations will work in Firefox, but the effect is not altered too much by it.

