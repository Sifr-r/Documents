# Fringe Cases

## Warnings & Notes

> [!NOTE]
> At least one policy restriction must be specified, so `minHdcpVersion` is only "technically" optional.

> [!NOTE]
> A status of `output-restricted` when you're using an external display can be caused by hardware HDCP incompatibility issues.
> If using a laptop, you may be able to "fix" this by disconnecting the external display.

## Exceptions

- `TypeError`
  - : The `policy` has no defined properties (policy restrictions), or a property key is not valid.

- `NotSupportedError`
  - : The CDM cannot determine the status for any or all of the policy restrictions.

