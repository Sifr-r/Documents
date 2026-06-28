# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `unescape()` is a non-standard function implemented by browsers and was only standardized for cross-engine compatibility. It is not required to be implemented by all JavaScript engines and may not work everywhere. Use {{jsxref("decodeURIComponent()")}} or {{jsxref("decodeURI()")}} if possible.

> [!NOTE]
> This function was used mostly for {{Glossary("Percent-encoding", "percent-encoding")}} and is partly based on the escape format in {{rfc(1738)}}. The `unescape()` function does _not_ evaluate [escape sequences](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences) in string literals. You can replace `\xXX` with `%XX` and `\uXXXX` with `%uXXXX` to get a string that can be handled by `unescape()`.

