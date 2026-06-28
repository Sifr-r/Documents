# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Access to individual high-entropy features can be controlled with their own [individual permissions policies](https://wicg.github.io/client-hints-infrastructure/#policy-controlled-features).

## Security Notes

Websites that support setting a [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) (via the HTTP {{HTTPHeader("Permissions-Policy")}} header or the {{HTMLElement("iframe")}} attribute [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow)) can restrict the ability to use the User-Agent Client Hints API using the directive {{HTTPHeader("Permissions-Policy/ch-ua-high-entropy-values", "ch-ua-high-entropy-values")}}.

Specifically, when the permission is not granted, the {{domxref("NavigatorUAData.getHighEntropyValues()")}} will only return low-entropy data such as `brands`, `mobile`, and `platform`.

For example, the following policy would only allow the current origin and two other specific origins to retrieve high-entropy data.

```http
Permissions-Policy: ch-ua-high-entropy-values=("self https://a.example.com" "https://b.example.com")
```

You could then embed one of the two other origins:

```html
<iframe src="https://a.example.com" allow="ch-ua-high-entropy-values"></iframe>
```

The default allowlist for `ch-ua-high-entropy-values` is `*`, which permits any content within the current document and all nested browsing contexts to use `getHighEntropyValues()`.

> [!NOTE]

