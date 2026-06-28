# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Directives have a default allowlist, which is always one of `*`, `self`, or `none` for the `Permissions-Policy` HTTP header, and governs the default behavior if they are not explicitly listed in a policy.
    > These are specified on the individual [directive reference pages](#directives). For `<iframe>` `allow` attributes, the default behavior is always `src`.

> [!NOTE]
> `"https://*.example.com"` does not match `"https://example.com"`.

> [!NOTE]
> To send all violation reports to the same endpoint we might instead define the [`"default"` reporting endpoint](/en-US/docs/Web/HTTP/Reference/Headers/Reporting-Endpoints#default_reporting_endpoint):
>
> ```http
> Reporting-Endpoints: default="https://example.com/reports"
> Permissions-Policy: geolocation=()
> ```

> [!NOTE]
> Chrome's server-side serialization of violation reports uses `policyId` rather than [`featureId`](/en-US/docs/Web/API/PermissionsPolicyViolationReport#featureid) for the feature name in the `body` of a server report.
> The {{domxref("PermissionsPolicyViolationReport")}} returned by a [`ReportingObserver`](/en-US/docs/Web/API/ReportingObserver) follows the specification.

