# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Permissions Policy used to be called Feature Policy. The name has changed, and so has the HTTP header syntax, so bear this in mind if you have used Feature Policy in the past, and check the browser support tables. The `<iframe allow=" ... ">` syntax has stayed the same.

> [!NOTE]
> Newly-introduced features may have an explicit API to signal the state. Existing features that later integrate with Permissions Policy will typically use existing mechanisms.

> [!NOTE]
> Scripts can programmatically query information about the permission policy via the {{DOMxRef("FeaturePolicy")}} object located at either {{DOMxRef("Document.featurePolicy")}} or {{DOMxRef("HTMLIFrameElement.featurePolicy")}}.

> [!NOTE]
> Directives have a default allowlist, which is always one of `*`, `self`, or `none` for the `Permissions-Policy` HTTP header, and governs the default behavior if they are not explicitly listed in a policy. These are specified on the individual [directive reference pages](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#directives). For `<iframe>` `allow` attributes, the default behavior is always `src`.

> [!NOTE]
> `"https://*.example.com"` does not match `"https://example.com"`.

> [!NOTE]
> As you'll have noticed, the syntax for `<iframe>` policies is a bit different to the syntax for `Permissions-Policy` headers. The former still uses the same syntax as the older Feature Policy specification, which was superseded by Permissions Policy.

