# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If using `role="button"` instead of the semantic `<button>` or `<input type="button">` elements, you will need to make the element focusable and define event handlers for {{domxref("Element/click_event", "click")}} and {{domxref("Element/keydown_event", "keydown")}} events. This includes handling the <kbd>Enter</kbd> and <kbd>Space</kbd> key presses in order to process all forms of user input. See [the official WAI-ARIA example code](https://www.w3.org/WAI/ARIA/apg/patterns/button/examples/button/).

> [!WARNING]
> Be careful when marking up links with the button role. Buttons are expected to be triggered using the <kbd>Space</kbd> or <kbd>Enter</kbd> key, while links are expected to be triggered using the <kbd>Enter</kbd> key. In other words, when links are used to behave like buttons, adding `role="button"` alone is not sufficient. It will also be necessary to add a key event handler that listens for the <kbd>Space</kbd> key in order to be consistent with native buttons.

