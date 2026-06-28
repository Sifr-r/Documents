# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Of those [characters with the "White_Space" property but are not in the "Space_Separator" general category](https://util.unicode.org/UnicodeJsps/list-unicodeset.jsp?a=%5Cp%7BWhite_Space%7D%26%5CP%7BGeneral_Category%3DSpace_Separator%7D), U+0009, U+000B, and U+000C are still treated as white space in JavaScript; U+0085 NEXT LINE has no special role; others become the set of [line terminators](#line_terminators).

> [!NOTE]
> Changes to the Unicode standard used by the JavaScript engine may affect programs' behavior. For example, ES2016 upgraded the reference Unicode standard from 5.1 to 8.0.0, which caused U+180E MONGOLIAN VOWEL SEPARATOR to be moved from the "Space_Separator" category to the "Format (Cf)" category, and made it a non-whitespace. Subsequently, the result of [`"\u180E".trim().length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trim) changed from `0` to `1`.

> [!WARNING]
> If you want scripts to be runnable directly in a shell environment, encode them in UTF-8 without a [BOM](https://en.wikipedia.org/wiki/Byte_order_mark). Although a BOM will not cause any problems for code running in a browser — because it's stripped during UTF-8 decoding, before the source text is analyzed — a Unix/Linux shell will not recognize the hashbang if it's preceded by a BOM character.

> [!NOTE]
> If, for some reason, you need to parse some JavaScript source yourself, do not assume all identifiers follow the pattern `/[A-Za-z_$][\w$]*/` (i.e., ASCII-only)! The range of identifiers can be described by the regex `/[$_\p{ID_Start}][$\p{ID_Continue}]*/u` (excluding unicode escape sequences).

> [!NOTE]
> This section discusses literals that are atomic tokens. [Object literals](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) and [array literals](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Array#array_literal_notation) are [expressions](/en-US/docs/Web/JavaScript/Reference/Operators) that consist of a series of tokens.

