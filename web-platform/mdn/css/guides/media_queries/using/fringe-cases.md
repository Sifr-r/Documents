# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The examples on this page use CSS's `@media` for illustrative purposes, but the basic syntax remains the same for all types of media queries.

> [!NOTE]
> A style sheet with a media query attached to its {{HTMLElement("link")}} tag [will still download](https://scottjehl.github.io/CSS-Download-Tests/) even if the query returns `false`, the download will happen but the priority of downloading will be much lower.
> Nevertheless, its contents will not apply unless and until the result of the query changes to `true`.
> You can read why this happens in Tomayac's blog [Why Browser Download Stylesheet with Non-Matching Media Queries](https://medium.com/@tomayac/why-browsers-download-stylesheets-with-non-matching-media-queries-eb61b91b85a2).

> [!NOTE]
> In most cases, the `all` media type is used by default when no other type is specified.
> However, if you use the `only` operator, you must explicitly specify a media type. You can see `only screen` or `only print` as a whole.

