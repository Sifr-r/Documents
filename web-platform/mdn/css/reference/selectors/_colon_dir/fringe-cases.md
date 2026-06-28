# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Be aware that the behavior of the `:dir()` pseudo-class is not equivalent to the `[dir=…]` [attribute selectors](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors). The latter match the HTML [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) attribute, and ignore elements that lack it — even if they inherit a direction from their parent. (Similarly, `[dir=rtl]` and `[dir=ltr]` won't match the `auto` value.) In contrast, `:dir()` will match the value calculated by the {{glossary("user agent")}}, even if inherited.

> [!NOTE]
> In HTML, the direction is determined by the [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) attribute. Other document types may have different methods.

