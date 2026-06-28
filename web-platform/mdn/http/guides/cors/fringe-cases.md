# Fringe Cases

## Warnings & Notes

> [!NOTE]
> WebKit Nightly and Safari Technology Preview place additional restrictions on the values allowed in the {{HTTPHeader("Accept")}}, {{HTTPHeader("Accept-Language")}}, and {{HTTPHeader("Content-Language")}} headers. If any of those headers have "nonstandard" values, WebKit/Safari does not consider the request to be a "simple request". What values WebKit/Safari consider "nonstandard" is not documented, except in the following WebKit bugs:
>
> - [Require preflight for non-standard CORS-safelisted request headers Accept, Accept-Language, and Content-Language](https://webkit.org/b/165178)
> - [Allow commas in Accept, Accept-Language, and Content-Language request headers for simple CORS](https://webkit.org/b/165566)
> - [Switch to a blacklist model for restricted Accept headers in simple CORS requests](https://webkit.org/b/166363)
>
> No other browsers implement these extra restrictions because they're not part of the spec.

> [!NOTE]
> When responding to a [credentialed requests](#requests_with_credentials) request, the server **must** specify an origin in the value of the `Access-Control-Allow-Origin` header, instead of specifying the `*` wildcard.

> [!NOTE]
> As described below, the actual `POST` request does not include the `Access-Control-Request-*` headers; they are needed only for the `OPTIONS` request.

> [!NOTE]
> When making credentialed requests to a different domain, third-party cookie policies will still apply. The policy is always enforced regardless of any setup on the server and the client as described in this chapter.

> [!NOTE]
> Some enterprise authentication services require that TLS client certificates be sent in preflight requests, in contravention of the [Fetch](https://fetch.spec.whatwg.org/#cors-protocol-and-credentials) specification.
>
> Firefox 87 allows this non-compliant behavior to be enabled by setting the preference: `network.cors_preflight.allow_client_cert` to `true` ([Firefox bug 1511151](https://bugzil.la/1511151)). Chromium-based browsers currently always send TLS client certificates in CORS preflight requests ([Chrome bug 775438](https://crbug.com/775438)).

> [!NOTE]
> The `origin` value can be `null`.

