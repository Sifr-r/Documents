# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Using `javascript:` URLs on the web is discouraged as it may lead to execution of arbitrary code, similar to the ramifications of using [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval). It may also reduce {{glossary("accessibility")}} because it deviates from normal link behavior.

> [!NOTE]
> Some other contexts that use URLs, such as the [`href`](/en-US/docs/Web/HTML/Reference/Elements/link#href) attribute of `<link>` elements, do not allow `javascript:` URLs, because they are resource locations, not navigation targets. For these cases, if you want to write JavaScript inline, use [`data:`](/en-US/docs/Web/URI/Reference/Schemes/data) URLs with the `text/javascript` MIME type.

