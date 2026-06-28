# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If a custom property has a value of `blue`, the equivalent hexadecimal code `#0000ff` will not match unless the property has been defined as a color with {{cssxref("@property")}} so the browser can properly compare computed values.

> [!NOTE]
> Plain and range syntax behave differently even when they look similar. Given `--n: calc(6/2)`, the query `style(--n: 3)` is **false** because the plain form compares the property's computed value (`calc(6/2)`) directly against `3`. The equivalent range query `style(--n = 3)` is **true** because the range form computes both sides numerically before comparing. See [Plain versus range syntax in style queries](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#plain_versus_range_syntax_in_style_queries) in the container style queries guide for more details.

