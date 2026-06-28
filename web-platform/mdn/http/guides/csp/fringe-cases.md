# Fringe Cases

## Warnings & Notes

> [!NOTE]
> A CSP can actually help protect against XSS in two different ways:
>
> - It can help ensure that input is sanitized before being used in the client: we discuss this later on in [Requiring trusted types](#requiring_trusted_types).
> - By controlling resource loads, a CSP can provide a defense in depth against XSS, protecting the website even if sanitization fails. This is the XSS defense that we will discuss in this section.

> [!NOTE]
> Setting a CSP is not an alternative to sanitizing input. Websites should sanitize input _and_ set a CSP, providing defense in depth against XSS.

> [!WARNING]
> Developers should avoid `'unsafe-inline'`, because it defeats much of the purpose of having a CSP. Inline JavaScript is one of the most common XSS vectors, and one of the most basic goals of a CSP is to prevent its uncontrolled use.

> [!WARNING]
> You can also use the CSP {{CSP("report-uri")}} directive to specify a target URL for CSP violation reports.
> This sends a slightly different JSON report format via a `POST` operation with a {{HTTPHeader("Content-Type")}} of `application/csp-report`.
> This approach is deprecated, but you should declare both until {{CSP("report-to")}} is supported in all browsers.
> For more information about the approach see the {{CSP("report-uri")}} topic.

