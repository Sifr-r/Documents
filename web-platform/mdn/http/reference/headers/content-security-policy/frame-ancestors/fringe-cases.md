# Fringe Cases

## Warnings & Notes

> [!NOTE]
> **`frame-ancestors`** allows you to specify what parent source may embed a page.
> This differs from **`frame-src`**, which allows you to specify where iframes in a page may be loaded from.

> [!NOTE]
> The **`frame-ancestors`** directive [checks each ancestor](https://w3c.github.io/webappsec-csp/#frame-ancestors-and-frame-options). If any ancestor doesn't match, the load is cancelled. Therefore all ancestors should be allowed by the **`frame-ancestors`** directive of leaf frames when using nested frames.

> [!NOTE]
> The `frame-ancestors` directive's syntax is similar to the source list syntax accepted by other directives (e.g., {{CSP("child-src")}}), but it does not fall back to the `default-src` setting. A policy that declares `default-src 'none'` still allows the resource to be embedded by anyone.

