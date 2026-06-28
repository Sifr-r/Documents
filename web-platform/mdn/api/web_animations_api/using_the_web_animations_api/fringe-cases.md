# Fringe Cases

## Warnings & Notes

> [!NOTE]
> There are a number of small differences between the terminology used in CSS Animations and the terminology used in Web Animations. For instance, Web Animations doesn't use the string `"infinite"`, but instead uses the JavaScript keyword `Infinity`. And instead of `timing-function` we use `easing`. We aren't listing an `easing` value here because, unlike CSS Animations where the default {{cssxref("animation-timing-function")}} is `ease`, in the Web Animations API the default easing is `linear` — which is what we want here.

> [!NOTE]
> Alternatively, you can define `rabbitDownAnimation` using the {{domxref("Animation/Animation", "Animation()")}} constructor instead, which doesn't start playing until you call `play()`.

