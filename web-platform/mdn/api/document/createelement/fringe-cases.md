# Fringe Cases

## Warnings & Notes

> [!NOTE]
> A new {{domxref("HTMLElement", "HTMLElement", "", "1")}} is returned if the document is an {{domxref("HTMLDocument", "HTMLDocument", "", "1")}}, which is the most common case.
> Otherwise a new {{domxref("Element","Element","","1")}} is returned.

    > [!NOTE]
    > Earlier versions of the specification were more restrictive, requiring that the `localName` be a valid [XML name](https://www.w3.org/TR/xml/#dt-name).

> [!NOTE]
> Check the [browser compatibility](#browser_compatibility) section for support, and the [`is`](/en-US/docs/Web/HTML/Reference/Global_attributes/is) attribute reference for caveats on implementation reality of customized built-in elements.

> [!NOTE]
> For backwards compatibility, some browsers will allow you to pass a string here instead of an object, where the string's value is the custom element's tag name.

## Exceptions

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Thrown if the [`localName`](#localname) value is not a valid element name.
    A string is a valid element name if its length is at least 1 and:
    - it starts with an alphabet character and does not contain ASCII whitespace, `NULL`, `/`, or `>` (U+0000, U+002F, or U+003E, respectively).
    - it starts with `:` (U+003A), `_` (U+005F), or any characters in the range U+0080 to U+10FFFF (inclusive), _and_ the remaining code points only include those same characters along with the ASCII alphanumeric characters, `-` (U+002D), and `.` (U+002E),

    > [!NOTE]

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if both the [`is`](#is) and [`customElementRegistry`](#customelementregistry) options are specified.

