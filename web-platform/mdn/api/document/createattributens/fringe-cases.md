# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Earlier versions of the specification were more restrictive, requiring that the `localName` be a valid [XML name](https://www.w3.org/TR/xml/#dt-name).

## Exceptions

- `NamespaceError` {{domxref("DOMException")}}
  - : Thrown if the [`namespaceURI`](#namespaceuri) value is:
    - not a valid namespace URI.
    - set to the empty string when `prefix` has a value.
    - not the value `http://www.w3.org/XML/1998/namespace` or `http://www.w3.org/2000/xmlns/` when [`prefix`](#prefix) is set to `xml` or `xmlns`, respectively.
- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Thrown if either the `prefix` or `localName` is not valid:
    - The `prefix` must have at least one character, and cannot contain ASCII whitespace, `NULL`, `/`, or `>` (U+0000, U+002F, or U+003E, respectively).
    - The `localName` must have at least one character, and may not contain ASCII whitespace, `NULL`, `/`, `=` or `>` (U+0000, U+002F, U+003D, or U+003E, respectively).

    > [!NOTE]

