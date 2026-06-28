# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The string given in parameter is converted to lowercase.

    > [!NOTE]
    > Earlier versions of the specification were more restrictive, requiring that the `localName` be a valid [XML name](https://www.w3.org/TR/xml/#dt-name).

## Exceptions

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Thrown if the [`localName`](#localname) value is not a valid attribute name.
    It must have at least one character, and may not contain ASCII whitespace, `NULL`, `/`, `=` or `>` (U+0000, U+002F, U+003D, or U+003E, respectively).

    > [!NOTE]

