# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If `someInterface` itself is `null` or
> `undefined`, a {{jsxref("TypeError")}} exception will still be
> raised ("someInterface is null"). If you expect that
> `someInterface` itself may be `null` or `undefined`,
> you have to use `?.` at this position as
> well: `someInterface?.customMethod?.()`.

