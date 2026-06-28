# Fringe Cases

## Warnings & Notes

> [!NOTE]
> RFC9110 prefers that servers send both `ETag` and `Last-Modified` for a `200` response if possible.
> During cache revalidation, if both `If-Modified-Since` and `If-None-Match` are present, then `If-None-Match` takes precedence for the validator.
> If you are only considering caching, you may think that `Last-Modified` is unnecessary.
> However, `Last-Modified` is not just useful for caching; it is a standard HTTP header that is also used by content-management (CMS) systems to display the last-modified time, by crawlers to adjust crawl frequency, and for other various purposes.
> So considering the overall HTTP ecosystem, it is better to provide both `ETag` and `Last-Modified`.

> [!NOTE]
> The `public` directive should only be used if there is a need to store the response when the `Authorization` header is set.
> It is not required otherwise, because a response will be stored in the shared cache as long as `max-age` is given.

> [!NOTE]
> When evaluating the use of `immutable` and QPACK:
> If you're concerned that `immutable` changes the predefined value provided by QPACK, consider that
> in this case, the `immutable` part can be encoded separately by splitting the `Cache-Control` value into two lines — though this is dependent on the encoding algorithm a particular QPACK implementation uses.

