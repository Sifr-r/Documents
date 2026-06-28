# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This directive is marked as obsolete in the specification.
> This directive was previously used to prevent "optionally blockable" mixed content from being fetched insecurely and displayed.
> Content that isn't blocked is now always upgraded to a secure connection, so this directive is not needed.

> [!NOTE]
> The {{CSP("upgrade-insecure-requests")}} directive is evaluated before `block-all-mixed-content`.
> If the former is set, the latter does nothing, so set one directive or the other – not both, unless you want to force HTTPS on older browsers that do not force it after a redirect to HTTP.

