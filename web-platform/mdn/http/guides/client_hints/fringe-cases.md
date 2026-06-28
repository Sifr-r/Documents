# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Client hints can also be specified in HTML using the {{HTMLElement("meta")}} element with the [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv) attribute.
>
> ```html
> <meta http-equiv="Accept-CH" content="Width, Downlink, Sec-CH-UA" />
> ```

> [!NOTE]
> The client hints set for a particular origin can also be cleared by sending a {{httpheader("Clear-Site-Data", "Clear-Site-Data: \"clientHints\"")}} response header for a URL inside that origin.

> [!NOTE]
> We've also specified `Sec-CH-Prefers-Reduced-Motion` in the {{httpheader("Vary")}} header to indicate to the browser that the served content will differ based on this header value, even if the URL stays the same, so the browser shouldn't just use an existing cached response and instead should cache this response separately. Each header listed in the `Critical-CH` header should also be present in the `Accept-CH` and `Vary` headers.

> [!NOTE]
> Servers currently get most of the same information by parsing the {{HTTPHeader("User-Agent")}} header.
> For historical reasons this header contains a lot of largely irrelevant information, and information that might be used to identify a _particular user_.
> UA client hints provide a more efficient and privacy preserving way of getting the desired information.
> They are eventually expected to replace this older approach.

> [!NOTE]
> User-agent client hints are not available inside [fenced frames](/en-US/docs/Web/API/Fenced_frame_API) because they rely on [permissions policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) delegation, which could be used to leak data.

