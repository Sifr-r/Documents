# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Chrome's server-side serialization uses `policyId` rather than `featureId` for the feature name in the body of a server report.
> For cross-browser compatibility, developers will need to process both fields in reporting endpoints.
> The report returned by a [`ReportingObserver`](/en-US/docs/Web/API/ReportingObserver) follows the specification.

> [!NOTE]
> To send all violation reports to the same endpoint we might instead define the [`"default"` reporting endpoint](/en-US/docs/Web/HTTP/Reference/Headers/Reporting-Endpoints#default_reporting_endpoint):
>
> ```http
> Reporting-Endpoints: default="https://example.com/reports"
> Permissions-Policy: geolocation=()
> ```

