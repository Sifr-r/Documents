# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To make words break _within themselves_, use {{CSSxRef("overflow-wrap")}}, {{CSSxRef("word-break")}}, or {{CSSxRef("hyphens")}} instead.

> [!NOTE]
> The spec defines a third constituent property: `white-space-trim`, which is not implemented in any browser yet.

> [!NOTE]
> The `white-space` property as a shorthand is a relatively new feature (see [browser compatibility](#browser_compatibility)). Originally, it had six keyword values; now, the value `nowrap` is instead interpreted as a value for {{cssxref("text-wrap-mode")}}, while the value `break-spaces` is interpreted as a value for {{cssxref("white-space-collapse")}}. The above four keywords are still specific to `white-space`, but they have longhand equivalents. The change to make `white-space` a shorthand expands acceptable values to even more keywords and combinations, such as `wrap` and `collapse`.

> [!NOTE]
> There is a distinction made between **spaces** and **other space separators**. These are defined as follows:
>
> - spaces
>   - : Spaces (U+0020), tabs (U+0009), and segment breaks (such as newlines).
> - other space separators
>   - : All other space separators defined in Unicode, other than those already defined as spaces.
>
> Where white space is said to _hang_, this can affect the size of the box when measured for intrinsic sizing.

