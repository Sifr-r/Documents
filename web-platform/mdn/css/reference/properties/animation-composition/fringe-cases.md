# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When you specify multiple comma-separated values on an `animation-*` property, they will be applied to the animations in the order in which the {{cssxref("animation-name")}}s appear. If the number of animations and compositions differ, the values listed in the `animation-composition` property will cycle from the first to the last `animation-name`, looping until all the animations have an assigned `animation-composition` value. For more information, see [Setting multiple animation property values](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

> [!NOTE]
> A composite operation can also be specified in a keyframe. In that case, the specified composite operation is used for each property first within that keyframe and then on each property in the next keyframe.

