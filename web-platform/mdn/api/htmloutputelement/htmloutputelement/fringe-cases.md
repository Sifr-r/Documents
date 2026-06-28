# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Currently only Safari implements this constructor, so using {{domxref("Document.createElement()")}} is recommended for broader compatibility — see the [example below](#creating_an_output_element_programmatically).

> [!NOTE]
> In practice, you would usually create {{htmlelement("output")}} elements using {{domxref("Document.createElement()")}} instead of this constructor, since `createElement()` is supported across all browsers.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown with the message `"Illegal constructor"` in browsers that do not support this constructor.

