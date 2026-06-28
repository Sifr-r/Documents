# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The approach described here (using the {{domxref("document.domain")}} setter) is deprecated because it undermines the security protections provided by the same origin policy, and complicates the origin model in browsers, leading to interoperability problems and security bugs.

> [!NOTE]
> When using `document.domain` to allow a subdomain to access its parent, you need to set `document.domain` to the _same value_ in both the parent domain and the subdomain. This is necessary even if doing so is setting the parent domain back to its original value. Failure to do this may result in permission errors.

