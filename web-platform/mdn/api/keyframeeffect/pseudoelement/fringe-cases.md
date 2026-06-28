# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If set to the legacy single-colon syntax of {{cssxref("::before", ":before")}}, {{cssxref("::after", ":after")}}, {{cssxref("::first-letter", ":first-letter")}}, or {{cssxref("::first-line", ":first-line")}}, the string is transformed into its double-colon modern version ({{cssxref("::before")}}, {{cssxref("::after")}}, {{cssxref("::first-letter")}}, and {{cssxref("::first-line")}}, respectively).

## Exceptions

- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown when trying to set this property to an element, an invalid pseudo-element (either non-existent or misspelled). The property is then left unchanged.

