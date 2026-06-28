# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `v` mode does not interpret grapheme clusters as single characters; they are still multiple code points. For example, `/[🇺🇳]/v` is still able to match `"🇺"`.

