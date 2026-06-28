# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the focus position appears before the anchor position in the document, the direction of the selection is reversed — the caret is placed at the beginning of the text rather the end, which matters for any keyboard command that might follow.
> For example, <kbd>Shift</kbd> + <kbd>➡︎</kbd> would cause the selection to narrow from the beginning rather than grow at the end.

> [!NOTE]
> There is intentionally no [whitespace](/en-US/docs/Web/CSS/Guides/Text/Whitespace#working_with_whitespace_in_the_dom) between the `<p class="one">` and `<p class="two">` start tags and the `<span>` start tags which follow them — to avoid the presence of text nodes that would affect the number of child nodes expected. (Even though those text nodes would be whitespace-only, they would still be additional child nodes; find out more from the [`Node.firstChild` example](/en-US/docs/Web/API/Node/firstChild#example)).

> [!NOTE]
> You can find this [example on GitHub](https://github.com/chrisdavidmills/selection-api-examples/blob/master/setBaseAndExtent.html) ([see it live also](https://chrisdavidmills.github.io/selection-api-examples/setBaseAndExtent.html).)

## Exceptions

- `IndexSizeError` {{domxref("DOMException")}}
  - : Thrown if `anchorOffset` is larger than the number of child nodes inside `anchorNode`, or if `focusOffset` is larger than the number of child nodes inside `focusNode`.

