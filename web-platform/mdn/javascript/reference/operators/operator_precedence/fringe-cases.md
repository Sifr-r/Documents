# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The behavior of short-circuiting is baked in these operators. Other operators would _always_ evaluate both operands, regardless if that's actually useful — for example, `NaN * foo()` will always call `foo`, even when the result would never be something other than `NaN`.

