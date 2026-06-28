# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `attr()` function can be used with any CSS property, but support for properties other than {{CSSxRef("content")}} is experimental.

        > [!NOTE]
        > If no namespace is specified (just an identifier is given, like `attr(foo)`), the null namespace is implied. This is usually what's desired, as namespaced attributes are rare. As with attribute selectors, the case-sensitivity of `<attr-name>` depends on the document language.

        > [!NOTE]
        > This keyword was originally named and supported in Chromium browsers as `string`. Both keywords will be supported briefly, for backward compatibility purposes.

        > [!NOTE]
        > For [security reasons](#limitations_and_security) {{CSSxRef("url_value", "&lt;url&gt;")}} is not allowed as an `attr()` data type.

