# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In UTF-16, Unicode characters above `\uFFFF` are
> encoded as two surrogate code units, of the range
> `\uD800` - `\uDFFF`. The value of each code unit is taken
> separately into account for the comparison. Thus the character formed by the surrogate
> pair `\uD855\uDE51` will be sorted before the character
> `\uFF3A`.

