# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `textContent` and {{domxref("HTMLElement.innerText")}} are easily confused, but the two properties are [different in important ways](#differences_from_innertext).

  > [!NOTE]
  > To get _all_ of the text and [CDATA data](/en-US/docs/Web/API/CDATASection) for the whole document, use `document.documentElement.textContent`.

> [!WARNING]
> Setting `textContent` on a node removes _all_ of the node's children and replaces them with a single text node with the given string value.

