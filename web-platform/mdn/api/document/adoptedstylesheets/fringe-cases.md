# Fringe Cases

## Warnings & Notes

> [!NOTE]
> A constructed stylesheet is a stylesheet created programmatically using the [`CSSStyleSheet()` constructor](/en-US/docs/Web/API/CSSStyleSheet/CSSStyleSheet) (as compared to one created by a user-agent when importing a stylesheet from a script, imported using {{HTMLElement('style')}} and {{CSSXref('@import')}}, or linked to via {{HTMLElement('link')}}).

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : One of the {{domxref("CSSStyleSheet")}} instances in the array was not created using the [`CSSStyleSheet()` constructor](/en-US/docs/Web/API/CSSStyleSheet/CSSStyleSheet) or was constructed in a different document than the current document, such as one in a frame.

