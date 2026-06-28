# Fringe Cases

## Warnings & Notes

> [!NOTE]
> While the {{cssxref("writing-mode")}} property is well supported, creating vertically-oriented form controls with `writing-mode` only gained full browser support in 2024.

> [!NOTE]
> The experimental `sideways-lr` and `sideways-rl` values have a similar effect as `vertical-lr` and `vertical-rl` respectively, except that normally vertical text characters (for example in Chinese or Japanese) are rotated 90 degrees to display on their sides, while horizontal text characters (for example in Latin languages) are unaffected by these values.

> [!NOTE]
> Best practice is to include a {{htmlelement("label")}} element for each form control, to associate a meaningful text description with each field for accessibility purposes (see [Use meaningful text labels](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_meaningful_text_labels) for more information). We haven't done that here, as this article focuses purely on aspects of the form controls' visual rendering, but you should make sure you do so in production code.

