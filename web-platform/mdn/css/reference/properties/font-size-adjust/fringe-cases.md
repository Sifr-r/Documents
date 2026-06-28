# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the specified `<font-metric>` has been overridden in {{cssxref("@font-face")}}, e.g., by using the [`size-adjust`](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/size-adjust) descriptor, then the overridden metric will be used in the `font-size-adjust` calculation. This means that when `font-size-adjust` and `size-adjust` are applied together, `size-adjust` does not have any effect.

> [!NOTE]
> Font metrics like x-height and cap height can vary between font faces (such as bold or italic variants) within the same {{cssxref("font-family")}}. When `font-size-adjust` uses `from-font` or a fixed value, the metrics of each font face are adjusted independently, regardless of the relative differences between font faces in the same font family.

