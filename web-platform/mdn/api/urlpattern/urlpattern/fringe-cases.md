# Fringe Cases

## Warnings & Notes

> [!NOTE]
> All the URL parts in the `input` properties and the `url` are optional.
> If not specified in those parameters, some values may be [inherited](#inheritance_from_a_baseurl) from the `baseURL`, depending on what other URL-parts are defined.
> Omitted parts are normalized to wildcards (`*`).

## Exceptions

- {{jsxref("TypeError")}}
  - : Indicates one of the following:
    - The given `input`, `url` or `baseURL` is not valid or syntactically correct.
    - The given `url` is relative, but no `baseURL` is provided to form a complete absolute URL.
    - A `baseURL` is provided, and input is an absolute pattern or a structured object.

