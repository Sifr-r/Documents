# Fringe Cases

## Warnings & Notes

> [!NOTE]
> To be clear, we're talking about whitespace _between HTML tags_, which becomes text nodes in the DOM. Any whitespace _inside a tag_ (between the angle brackets but not as part of an attribute value) is just part of the HTML syntax and does not appear in the DOM.

> [!NOTE]
> Due to the magic that is HTML parsing (quote from [DOM spec](https://dom.spec.whatwg.org/#introduction-to-the-dom)), there do exist certain places where whitespace characters could be ignored. For example, whitespace between the `<html>` and `<head>` opening tags or between the `</body>` and `</html>` closing tags is ignored and does not appear in the DOM. Also, when parsing the {{HTMLElement("pre")}} element's text content, a single leading newline character gets stripped. We ignore these edge cases.
>
> Furthermore, the HTML parser does [_normalize_ certain whitespaces](https://html.spec.whatwg.org/multipage/parsing.html#preprocessing-the-input-stream): it replaces CR and [CRLF](/en-US/docs/Glossary/CRLF) sequences with a single LF. However, CR characters can also be inserted into the DOM either via [character references](/en-US/docs/Glossary/Character_reference) or JavaScript, so the CSS whitespace processing rules still need to define how to handle them.

> [!NOTE]
> [Firefox DevTools](https://firefox-source-docs.mozilla.org/devtools-user/index.html) supports highlighting text nodes, enabling you to see exactly which nodes contain whitespace characters. Pure whitespace nodes are marked with a "whitespace" label.

> [!NOTE]
> This algorithm can be configured via the {{cssxref("white-space-collapse")}} property (or its shorthand property {{cssxref("white-space")}}). We'll start by assuming its default value (`white-space-collapse: collapse`), then look at how different property values affect this algorithm.

> [!NOTE]
> This algorithm can be configured via the {{cssxref("white-space-collapse")}} property (or its shorthand property {{cssxref("white-space")}}). We'll start by assuming its default value (`white-space-collapse: collapse`), then look at how different property values affect this algorithm.

