# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You should specify a separate {{cssxref("border-style")}} in case the border image fails to load. Although the specification doesn't strictly require it, some browsers don't render the border image if {{cssxref("border-style")}} is `none` or {{cssxref("border-width")}} is `0`.

> [!NOTE]
> If the [computed value](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) of {{cssxref("border-image-source")}} is `none`, or if the image cannot be displayed, the {{cssxref("border-style")}} will be displayed instead.

> [!NOTE]
> There is a new `{{cssxref("background-clip")}}: border-area` value [being proposed](https://github.com/w3c/csswg-drafts/issues/9456) to address this use case.

