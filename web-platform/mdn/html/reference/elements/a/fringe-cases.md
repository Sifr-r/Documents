# Fringe Cases

## Warnings & Notes

> [!NOTE]
      > Specifying multiple URLs means that multiple attribution sources can be registered on the same feature. You might for example have different campaigns that you are trying to measure the success of, which involve generating different reports on different data.

    > [!NOTE]
    >
    > - `download` only works for [same-origin URLs](/en-US/docs/Web/Security/Defenses/Same-origin_policy), or the `blob:` and `data:` schemes.
    > - How browsers treat downloads varies by browser, user settings, and other factors. The user may be prompted before a download starts, or the file may be saved automatically, or it may open automatically, either in an external application or in the browser itself.
    > - If the `Content-Disposition` header has different information from the `download` attribute, resulting behavior may differ:
    >   - If the header specifies a `filename`, it takes priority over a filename specified in the `download` attribute.
    >   - If the header specifies a disposition of `inline`, Chrome and Firefox prioritize the attribute and treat it as a download. Old Firefox versions (before 82) prioritize the header and will display the content inline.

    > [!NOTE]
    > Setting `target="_blank"` on `<a>` elements implicitly provides the same `rel` behavior as setting [`rel="noopener"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noopener) which does not set `window.opener`.

    > [!NOTE]
    > This attribute is deprecated and **should not be used by authors**. Use the HTTP {{HTTPHeader("Content-Type")}} header on the linked URL.

    > [!NOTE]
    > Use the global attribute [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) instead.

    > [!NOTE]
    > Use the {{HTMLElement("area")}} element for image maps instead.

> [!NOTE]
> You can use `href="#top"` or the empty fragment (`href="#"`) to link to the top of the current page, [as defined in the HTML specification](https://html.spec.whatwg.org/multipage/browsing-the-web.html#scroll-to-the-fragment-identifier).

## Security Notes

`<a>` elements can have consequences for users' security and privacy. See [`Referer` header: privacy and security concerns](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns) for information.

Using `target="_blank"` without [`rel="noreferrer"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noreferrer) and [`rel="noopener"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noopener) makes the website vulnerable to {{domxref("window.opener")}} API exploitation attacks, although note that, in newer browser versions setting `target="_blank"` implicitly provides the same protection as setting `rel="noopener"`. See [browser compatibility](#browser_compatibility) for details.

