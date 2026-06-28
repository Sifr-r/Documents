# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This script passed to the `url` element is executed.
> APIs like this are known as [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), and are potentially a vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.
>
> You can mitigate this risk by having a [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) that restricts the locations from which scripts can be loaded, and by always assigning {{domxref("TrustedScriptURL")}} objects instead of strings and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> See [Security considerations](#security_considerations) for more information.

## Exceptions

- `NetworkError` {{domxref("DOMException")}}
  - : Thrown if the MIME type of the worker script is incorrect.
    It _should_ always be `text/javascript` (for historical reasons [other JavaScript MIME types](/en-US/docs/Web/HTTP/Guides/MIME_types#legacy_javascript_mime_types) may be accepted).
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the document is not allowed to start workers, e.g., if the URL has an invalid syntax or if the same-origin policy is violated.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if `url` cannot be parsed.
- `TypeError`
  - : Thrown if the `url` parameter is a string when [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) are [enforced by a CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) and no default policy is defined.

## Security Notes

The script or module specified by the `url` argument is executed in the web worker context, and may itself import other same-origin and cross-origin scripts.
If the `url` is provided by a user, this is a possible vector for [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) attacks.

While web workers do not have direct access to the owning document or window, it is still extremely risky to accept and execute arbitrary URLs from untrusted origins.
For module workers, but not classic workers, CORS will control what cross-origin resources can be requested.

A website should also control what scripts that are allowed to run using a [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) with the [`worker-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/worker-src) directive (or a fallback to [`child-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/child-src), [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src), or [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src)).
This can restrict scripts to those from the current origin, or a specific set of origins, or even particular files.

If you're using this property and [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) (using the [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP directive), you will need to always assign {{domxref("TrustedScriptURL")}} objects instead of strings.
This ensures that the input is passed through a transformation function, which has the chance to reject or modify URLs needed by the worker before they are fetched.

