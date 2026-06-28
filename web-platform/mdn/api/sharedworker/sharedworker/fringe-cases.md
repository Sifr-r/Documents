# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The script passed to the `url` parameter is executed.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.
>
> You can mitigate this risk by having a [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) that restricts the locations from which scripts can be loaded, and by always assigning {{domxref("TrustedScriptURL")}} objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](/en-US/docs/Web/API/Worker/Worker#security_considerations) in the `Worker()` constructor for more information.

> [!WARNING]
> Once a shared worker with a particular URL and `name` is running, the `type`, `credentials`, and `extendedLifetime` options are fixed.
> Constructing a new shared worker for the same script and `name` will error if you specify different values for these options.
> If different options are required for the same script, then start two workers with different `name` values.

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the document is not allowed to start workers, for example if the URL has an invalid syntax or if the same-origin policy is violated, or if the `sameSiteCookies` value is not supported in the given context.
- `NetworkError` {{domxref("DOMException")}}
  - : Thrown if the MIME type of the worker script is incorrect.
    It should _always_ be `text/javascript` (for historical reasons [other JavaScript MIME types](/en-US/docs/Web/HTTP/Guides/MIME_types#textjavascript) may be accepted).
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if `url` cannot be parsed.
- `TypeError`
  - : Thrown if the `url` parameter is a string when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.

