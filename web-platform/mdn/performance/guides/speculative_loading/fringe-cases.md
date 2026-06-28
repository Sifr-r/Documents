# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The above descriptions are high-level and general. Exactly what browsers will do to achieve prefetching and prerendering depends on the features used. More exact feature descriptions are provided in the [Speculative loading features](#speculative_loading_features) section below.

> [!NOTE]
> See [Using dns-prefetch](/en-US/docs/Web/Performance/Guides/dns-prefetch) for more details.

> [!NOTE]
> `<link rel="prefetch">` is functionally equivalent to a {{domxref("Window/fetch", "fetch()")}} call with a `priority: "low"` option set on it, except that the former will generally have an even lower priority, and it will have a [`Sec-Purpose: prefetch`](/en-US/docs/Web/HTTP/Reference/Headers/Sec-Purpose) header set on the request.

> [!NOTE]
> The fetch request for a `prefetch` operation results in an HTTP Request that includes the HTTP header [`Sec-Purpose: prefetch`](/en-US/docs/Web/HTTP/Reference/Headers/Sec-Purpose). A server might use this header to change the cache timeouts for the resources, or perform other special handling.
> The request will also include the {{HTTPHeader("Sec-Fetch-Dest")}} header with the value set to `empty`.
> The {{HTTPHeader("Accept")}} header in the request will match the value used for normal navigation requests. This allows the browser to find the matching cached resources following navigation.
> If a response is returned, it gets cached with the request in the HTTP cache.

> [!NOTE]
> This technology was only ever available in Chrome, and is now deprecated and [no longer performs a prerender as the name suggests](https://developer.chrome.com/blog/nostate-prefetch). You should use the [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) instead, which supersedes this.

