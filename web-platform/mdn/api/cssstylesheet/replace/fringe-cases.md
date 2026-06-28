# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > If any of the rules passed in `text` are an external stylesheet imported with the {{cssxref("@import")}} rule, those rules will be removed, and a warning printed to the console.

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if one of these two conditions is met:
    - The stylesheet was not created using the {{domxref("CSSStyleSheet.CSSStyleSheet()","CSSStyleSheet()")}} constructor.
    - The stylesheet is flagged as unmodifiable.

