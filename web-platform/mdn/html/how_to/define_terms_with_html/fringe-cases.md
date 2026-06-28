# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Another use for bold is to emphasize content. Bold itself is a concept foreign to HTML, but there are [tags for indicating emphasis.](/en-US/docs/Learn_web_development/Core/Structuring_content/Emphasis_and_importance)

> [!NOTE]
> The HTML spec does indeed [set aside the `title` attribute](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-abbr-element) for expanding the abbreviation. However, this is not an acceptable alternative for providing an inline expansion. The contents of `title` are completely hidden from your users, unless they're using a mouse and they happen to hover over the abbreviation. The spec duly [acknowledges this as well.](https://html.spec.whatwg.org/multipage/dom.html#attr-title)

> [!NOTE]
> Description lists are [not suitable for marking up dialog,](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dl-element) because conversation does not directly describe the speakers. Here are [recommendations for marking up dialog](https://html.spec.whatwg.org/multipage/semantics-other.html#conversations).

> [!NOTE]
> The basic pattern, as you can see, is to alternate `<dt>` terms with `<dd>` descriptions. If two or more terms occur in a row, the following description applies to all of them. If two or more descriptions occur in a row, they all apply to the last given term.

