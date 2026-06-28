# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `url` and `base` arguments will each be stringified from whatever value you pass, such as an {{domxref("HTMLAnchorElement")}} or {{domxref("HTMLAreaElement")}} element, just like with other Web APIs that accept a string.
> In particular, you can use an existing {{domxref("URL")}} object for either argument, and it will be stringified from the object's {{domxref("URL.href", "href")}} property.

> [!NOTE]
> [Resolving relative references to a URL](/en-US/docs/Web/API/URL_API/Resolving_relative_references) provides additional examples demonstrating how different `url` and `base` values are resolved to a final absolute URL.

## Exceptions

- {{jsxref("TypeError")}}
  - : `url` (in the case of absolute URLs) or `base` + `url` (in the case of relative references) is not a valid URL.

