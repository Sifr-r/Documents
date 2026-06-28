# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Earlier versions of the specification were more restrictive, requiring that the `qualifiedName` be a valid [XML name](https://www.w3.org/TR/xml/#dt-name).

## Exceptions

- `NamespaceError` {{domxref("DOMException")}}
  - : Thrown if the [`namespaceURI`](#namespaceuri) value is:
    - not a valid namespace URI.
    - set to the empty string when `prefix` has a value.
    - not the value `http://www.w3.org/XML/1998/namespace` or `http://www.w3.org/2000/xmlns/` when [`prefix`](#prefix) is set to `xml` or `xmlns`, respectively.
- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Thrown if either the `prefix` or `localName` is not valid:
    - The `prefix` must have at least one character, and cannot contain ASCII whitespace, `NULL`, `/`, or `>` (U+0000, U+002F, or U+003E, respectively).
    - The `localName` is a valid element name if it has a length of at least 1 and:
      - it starts with an alphabet character and does not contain ASCII whitespace, `NULL`, `/`, or `>` (U+0000, U+002F, or U+003E, respectively).
      - it starts with `:` (U+003A), `_` (U+005F), or any characters in the range U+0080 to U+10FFFF (inclusive), _and_ the remaining code points only include those same characters along with the ASCII alphanumeric characters, `-` (U+002D), and `.` (U+002E),

    > [!NOTE]

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if both the [`is`](#is) and [`customElementRegistry`](#customelementregistry) options are specified.

