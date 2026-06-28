# Fringe Cases

## Warnings & Notes

> [!WARNING]
> While the `open` property is technically not read-only and can be set directly, doing so is strongly discouraged by [the HTML specification](https://html.spec.whatwg.org/multipage/interactive-elements.html#note-dialog-remove-open-attribute), as it can break normal dialog interactions in unexpected ways.
> For example, the [`close`](/en-US/docs/Web/API/HTMLDialogElement/close_event) event won't fire when programmatically setting `open` to `false`, and subsequent calls to the [`close()`](/en-US/docs/Web/API/HTMLDialogElement/close) and [`requestClose()`](/en-US/docs/Web/API/HTMLDialogElement/requestClose) methods will have no effect.
> Instead, it's better to use methods such as [`show()`](/en-US/docs/Web/API/HTMLDialogElement/show), [`showModal()`](/en-US/docs/Web/API/HTMLDialogElement/showModal), `close()`, and `requestClose()` to change the value of the `open` attribute.

