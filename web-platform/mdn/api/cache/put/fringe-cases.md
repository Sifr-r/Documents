# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `put()` will overwrite any key/value pair
> previously stored in the cache that matches the request.

> [!NOTE]
> {{domxref("Cache.add")}}/{{domxref("Cache.addAll")}} do not
> cache responses with `Response.status` values that are not in the 200
> range, whereas `Cache.put` lets you store any request/response pair. As a
> result, {{domxref("Cache.add")}}/{{domxref("Cache.addAll")}} can't be used to store
> opaque responses, whereas `Cache.put` can.

## Exceptions

- {{jsxref("TypeError")}}
  - : Returned if the URL scheme is not `http` or `https`.

