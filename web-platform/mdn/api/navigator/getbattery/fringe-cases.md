# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Access to this feature may be controlled by the {{HTTPHeader("Permissions-Policy")}} directive {{HTTPHeader("Permissions-Policy/battery", "battery")}}.

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Use of this feature was blocked by a [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

- `SecurityError` {{domxref("DOMException")}}
  - : The User Agent does not expose battery information to insecure contexts and this method was called from an insecure context.

