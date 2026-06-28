# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Earlier versions of the specification returned a {{domxref("CSSStyleDeclaration")}} (from which {{domxref("CSSStyleProperties")}} is derived).
> See the [browser compatibility](#browser_compatibility) table for browser support information.

> [!WARNING]
> Returned values are sometimes deliberately inaccurate.
> To avoid the "CSS History Leak" security issue, browsers may lie about the computed styles for a visited link, returning values as if the user never visited the linked URL.
> See [Plugging the CSS history leak](https://blog.mozilla.org/security/2010/03/31/plugging-the-css-history-leak/) and [Privacy-related changes coming to CSS `:visited`](https://hacks.mozilla.org/2010/03/privacy-related-changes-coming-to-css-vistited/) for examples of how this is implemented.

    > [!NOTE]
    > Valid pseudo-element selector refers to syntactic validity, e.g., `::unsupported` is considered valid, even though the pseudo-element itself is not supported.

## Exceptions

- {{JSxRef("TypeError")}}
  - : If the passed object is not an {{DOMxRef("Element")}} or the `pseudoElt` is not a valid pseudo-element selector or is {{CSSxRef("::part", "::part()")}} or {{CSSxRef("::slotted", "::slotted()")}}.

    > [!NOTE]

