# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `escape()` is a non-standard function implemented by browsers and was only standardized for cross-engine compatibility. It is not required to be implemented by all JavaScript engines and may not work everywhere. Use {{jsxref("encodeURIComponent()")}} or {{jsxref("encodeURI()")}} if possible.

> [!NOTE]
> This function was used mostly for {{Glossary("Percent-encoding", "percent-encoding")}} and is partly based on the escape format in {{rfc(1738)}}. The escape format is _not_ an [escape sequence](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences) in string literals. You can replace `%XX` with `\xXX` and `%uXXXX` with `\uXXXX` to get a string containing actual string-literal escape sequences.

