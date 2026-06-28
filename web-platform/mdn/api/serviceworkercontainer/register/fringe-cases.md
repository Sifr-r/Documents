# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The `scriptURL` parameter passed to this method represents the URL of an external script loaded into a service worker.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.
>
> You can mitigate this risk by having a [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) that restricts the locations from which scripts can be loaded, and by always assigning {{domxref("TrustedScriptURL")}} objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](#security_considerations) for more information.

> [!NOTE]
> It is generally safer not to define registrations that have overlapping scopes.

## Exceptions

- `TypeError`
  - : The `scriptURL` or `scope URL` is a failure.
    This can happen if the URL can't be resolved to a valid URL or uses a scheme that is not `http:` or `https`.
    It may also happen if `scriptURL` is not a {{domxref("TrustedScriptURL")}}, and this is a requirement of the site's [Trusted Types Policy](/en-US/docs/Web/API/Trusted_Types_API).

    The exception is also raised if the `scriptURL` or `scope URL` path contains the case-insensitive ASCII "%2F" (`/`) or "%5C" (`\`)

- `SecurityError` {{domxref("DOMException")}}
  - : The `scriptURL` is not a potentially trustworthy origin, such as `localhost` or an `https` URL.
    The `scriptURL` and scope are not same-origin with the registering page.

## Security Notes

The `scriptURL` parameter specifies the script for the service worker, which can intercept network requests for pages within its scope and return responses that are fresh, cached, new, or modified.
If the input is provided by a user, this is a possible vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.

It is extremely risky to accept and execute arbitrary URLs from untrusted origins.
A website should control what scripts that are allowed to run using a [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) with the [`worker-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/worker-src) directive (or a fallback defined in [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) or [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src)).
This can restrict scripts to those from the current origin, or a specific set of origins, or even particular files.

If you're using this property and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) (using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive), you will need to always assign {{domxref("TrustedScriptURL")}} objects instead of strings.
This ensures that the input is passed through a transformation function, which has the chance to reject or modify the URL before it is injected.

