# Fringe Cases

## Warnings & Notes

> [!NOTE]
> According to the [WHATWG forms spec](https://html.spec.whatwg.org/multipage/forms.html#concept-input-apply), the `selectionStart` property applies only to inputs of types text, search, URL, tel, and password. On other input types, reading `selectionStart` returns `null`, and setting it throws an `InvalidStateError`.

