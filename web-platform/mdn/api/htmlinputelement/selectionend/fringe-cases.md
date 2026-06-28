# Fringe Cases

## Warnings & Notes

> [!NOTE]
> According to the [WHATWG forms spec](https://html.spec.whatwg.org/multipage/forms.html#concept-input-apply) `selectionEnd` property applies only to inputs of types text, search, URL, tel, and password. In modern browsers, throws an exception while setting `selectionEnd` property on the rest of input types. Additionally, this property returns `null` while accessing `selectionEnd` property on non-text input elements.

