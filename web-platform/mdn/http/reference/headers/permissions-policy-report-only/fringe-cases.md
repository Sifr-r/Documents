# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Chrome's server-side serialization of violation reports uses `policyId` rather than [`featureId`](/en-US/docs/Web/API/PermissionsPolicyViolationReport#featureid) for the feature name in the `body` of a server report.
> The {{domxref("PermissionsPolicyViolationReport")}} returned by a [`ReportingObserver`](/en-US/docs/Web/API/ReportingObserver) follows the specification.

