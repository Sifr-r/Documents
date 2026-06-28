# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Usage of the `getHighEntropyValues()` method to retrieve high-entropy user-agent data can be controlled via the {{HTTPHeader('Permissions-Policy/ch-ua-high-entropy-values', 'ch-ua-high-entropy-values')}} {{HTTPHeader('Permissions-Policy')}}.
> If the permission is not allowed, the method will only return the `brands`, `mobile`, and `platform` low-entropy data.

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the user-agent decides that one or more of the `hints` requested should not be returned.

