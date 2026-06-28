# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The deletion silently fails if no cookie is matched.

> [!NOTE]
> Cookies created with `set()` always have a [default path](/en-US/docs/Web/HTTP/Guides/Cookies#define_where_cookies_are_sent) of `/`, while cookies created with `document.cookie` have a default path equal to the path of the document they are created in.
> Therefore when deleting cookies created with `document.cookie`, you can't assume they have the path `/` (unless it was been explicitly set as such), and hence that it will match the default `delete()` options.

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the origin can not be {{glossary("Serialization", "serialized")}} to a URL.
- {{jsxref("TypeError")}}
  - : Thrown if a cookie that matches a given `name` or `options` cannot be deleted.

