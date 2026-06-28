# Fringe Cases

## Warnings & Notes

> [!NOTE]
> While the values can be set here and will be used internally, some browsers will only return `name` and `value` options from {{domxref("CookieStore.get()")}} and {{domxref("CookieStore.getAll()")}}.

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the origin can not be {{glossary("Serialization", "serialized")}} to a URL.
- {{jsxref("TypeError")}}
  - : Thrown if:
    - Both the `expires` and `maxAge` properties are set.
    - Setting the cookie with the given `name` and `value` or `options` fails in any other way.

