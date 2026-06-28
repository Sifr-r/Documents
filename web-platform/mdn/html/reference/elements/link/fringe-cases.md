# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Only `link` elements in the document's `<head>` can possibly block rendering. By default, a `link` element with `rel="stylesheet"` in the `<head>` blocks rendering when the browser discovers it during parsing. If such a `link` element is added dynamically via script, you must additionally set `blocking = "render"` for it to block rendering.

    > [!NOTE]
    > Most icon formats are only able to store one single icon; therefore, most of the time, the [`sizes`](#sizes) attribute contains only one entry.
    > Microsoft's ICO format and Apple's ICNS format can store multiple icon sizes in a single file. ICO has better browser support, so you should use this format if cross-browser support is a concern.

    > [!NOTE]
    > To produce the same effect as this obsolete attribute, use the {{HTTPHeader("Content-Type")}} HTTP header on the linked resource.

    > [!NOTE]
    > Instead of `rev`, you should use the [`rel`](#rel) attribute with the opposite [link type value](/en-US/docs/Web/HTML/Reference/Attributes/rel).
    > For example, to establish the reverse link for `made`, specify `author`. Also, this attribute doesn't stand for "revision" and must not be used with a version number, even though many sites misuse it in this way.

> [!NOTE]
> The `load` event fires once the stylesheet and all of its imported content has been loaded and parsed, and immediately before the styles start being applied to the content.

