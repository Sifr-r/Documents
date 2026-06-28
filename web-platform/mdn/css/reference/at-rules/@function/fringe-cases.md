# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If multiple CSS functions are given the same name, the function in the stronger cascade {{cssxref("@layer")}} wins. If all of them are in the same layer, the function defined last in the source order wins.

> [!NOTE]
> If an invalid value is passed in as a function argument and a default value is specified in that parameter definition, the invalid value will be ignored, and the default value will be used instead.

> [!NOTE]
> CSS functions behave in the same way as the rest of CSS regarding conflict resolution — last in source order wins. Therefore, in the above function, the `result` is `var(--wide)` unless the media query test returns true, in which case it is overridden by `var(--narrow)`.
>
> There are no early returns in CSS functions like there are in JavaScript functions. In the above function, if the media query was written first, before the single `result` line, the `result` would always be `var(--wide)` because it would override `var(--narrow)` in cases where the media query test returns true.

