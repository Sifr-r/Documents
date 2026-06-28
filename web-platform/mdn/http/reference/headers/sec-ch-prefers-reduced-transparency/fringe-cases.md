# Fringe Cases

## Warnings & Notes

> [!NOTE]
> We've also specified `Sec-CH-Prefers-Reduced-Transparency` in the {{httpheader("Vary")}} header, to indicate to the browser that the served content will differ based on this header value — even if the URL stays the same — so the browser shouldn't just use an existing cached response and instead should cache this response separately. Each header listed in the `Critical-CH` header should also be present in the `Accept-CH` and `Vary` headers.

