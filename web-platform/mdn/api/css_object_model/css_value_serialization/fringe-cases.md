# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The [CSS Typed OM API](/en-US/docs/Web/API/CSS_Typed_OM_API) is able to represent units and other CSS syntaxes; however, style declarations retrieved from an element are still processed and don't preserve the original syntax. For example, `CSS.cm(1).toString()` returns `"1cm"` instead of serializing to pixels, but `element.computedStyleMap().get("margin-left").toString()` returns the resolved pixel value.

> [!NOTE]
> There are a lot of complex details regarding how CSS properties are serialized, especially for complex properties like `font`. They may be unspecified in the specifications or even inconsistent across browsers. You need to test and verify the behavior for your specific use case.

