# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Using _mutation events_ is problematic:
>
> - Their design is [flawed](https://lists.w3.org/Archives/Public/public-webapps/2011JulSep/0779.html).
> - Adding DOM mutation listeners to a document [profoundly degrades the performance](https://groups.google.com/g/mozilla.dev.platform/c/L0Lx11u5Bvs?pli=1) of further DOM modifications to that document (making them 1.5 - 7 times slower!). Moreover, removing the listeners does not reverse the damage.
> - They have poor cross-browser compatibility: Safari doesn't support `DOMAttrModified` (see [WebKit bug 8191](https://webkit.org/b/8191)) and Firefox doesn't support _mutation name events_ (like `DOMElementNameChanged` and `DOMAttributeNameChanged`).
>
> They have been deprecated in favor of [mutation observers](/en-US/docs/Web/API/MutationObserver). **Consider using these instead.**

