# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `"".split("")` is therefore the only way to produce an empty array when a string is passed as `separator` and `limit` is not `0`.

> [!WARNING]
> When the empty string (`""`) is used as a separator, the string is **not** split by _user-perceived characters_ ([grapheme clusters](https://unicode.org/reports/tr29/#Grapheme_Cluster_Boundaries)) or unicode characters (code points), but by UTF-16 code units. This destroys [surrogate pairs](https://unicode.org/faq/utf_bom.html#utf16-2). See ["How do you get a string to a character array in JavaScript?" on Stack Overflow](https://stackoverflow.com/questions/4547609/how-to-get-character-array-from-a-string/34717402#34717402).

> [!NOTE]
> `\d` matches the [character class](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes) for digits between 0 and 9.

