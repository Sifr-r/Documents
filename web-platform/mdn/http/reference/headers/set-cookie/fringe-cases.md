# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Browsers block frontend JavaScript code from accessing the `Set-Cookie` header, as required by the Fetch spec, which defines `Set-Cookie` as a [forbidden response header name](https://fetch.spec.whatwg.org/#forbidden-response-header-name) that [must be filtered out](https://fetch.spec.whatwg.org/#ref-for-forbidden-response-header-name%E2%91%A0) from any response exposed to frontend code.
>
> When a [Fetch API](/en-US/docs/Web/API/Fetch_API/Using_Fetch) or [XMLHttpRequest API](/en-US/docs/Web/API/XMLHttpRequest_API) request [uses CORS](/en-US/docs/Web/HTTP/Guides/CORS#what_requests_use_cors), browsers will ignore `Set-Cookie` headers present in the server's response unless the request includes credentials. Visit [Using the Fetch API - Including credentials](/en-US/docs/Web/API/Fetch_API/Using_Fetch#including_credentials) and the [XMLHttpRequest article](/en-US/docs/Web/API/XMLHttpRequest_API) to learn how to include credentials.

    > [!NOTE]
    > Some cookie names contain prefixes that impose specific restrictions on the cookie's attributes in supporting user-agents. See [Cookie prefixes](#cookie_prefixes) for more information.

    > [!WARNING]
    > Many web browsers have a _session restore_ feature that will save all tabs and restore them the next time the browser is used. Session cookies will also be restored, as if the browser was never closed.

    > [!NOTE]
    > The `path` attribute lets you control what cookies the browser sends based on the different parts of a site.
    > It is not intended as a security measure, and [does not protect](/en-US/docs/Web/API/Document/cookie#security) against unauthorized reading of the cookie from a different path.

        > [!NOTE]
        > When `Lax` is applied as a default, a more permissive version is used. In this more permissive version, cookies are also included in {{httpmethod("POST")}} requests, as long as they were set no more than two minutes before the request was made.

    > [!NOTE]
    > Do not assume that `Secure` prevents all access to sensitive information in cookies (session keys, login details, etc.).
    > Cookies with this attribute can still be read/modified either with access to the client's hard disk or from JavaScript if the `HttpOnly` cookie attribute is not set.
    >
    > Insecure sites (`http:`) cannot set cookies with the `Secure` attribute. The `https:` requirements are ignored when the `Secure` attribute is set by localhost.

> [!WARNING]
> You cannot count on these additional assurances on browsers that don't support cookie prefixes; in such cases, prefixed cookies will always be accepted.

> [!NOTE]
> Partitioned cookies must be set with `Secure`. In addition, it is recommended to use a `__Host` or `__Host-Http-` prefix when setting partitioned cookies to make them bound to the hostname and not the registrable domain.

