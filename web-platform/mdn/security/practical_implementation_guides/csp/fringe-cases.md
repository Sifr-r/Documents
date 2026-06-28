# Fringe Cases

## Warnings & Notes

> [!NOTE]
> CSP is one part of a complete strategy for protecting against XSS attacks. There are other factors involved, such as [output encoding](/en-US/docs/Web/Security/Attacks/XSS#output_encoding) and [sanitization](/en-US/docs/Web/Security/Attacks/XSS#sanitization), which are also important.

> [!NOTE]
> Before implementing any actual CSP with the `Content-Security-Policy` header, you are advised to first test it out using the [`Content-Security-Policy-Report-Only`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy-Report-Only) HTTP header; see [Report-only CSPs](#report-only_csps) below.

> [!WARNING]
> If at all possible, avoid including unsafe sources inside your CSP. Examples include:
>
> - `unsafe-inline`.
> - `data:` URIs inside `script-src`, `object-src`, or `default-src`.
> - Overly broad sources or form submission targets.

> [!NOTE]
> The `report-to` directive is preferred over the deprecated `report-uri` directive. However, both are still needed because `report-to` does not yet have full cross-browser support.

