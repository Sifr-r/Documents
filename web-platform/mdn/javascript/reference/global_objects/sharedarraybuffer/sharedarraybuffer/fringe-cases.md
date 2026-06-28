# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `SharedArrayBuffer` constructor may not always be globally available unless certain [security requirements](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) are met.

> [!NOTE]
> `SharedArrayBuffer()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}.

> [!NOTE]
> It is recommended that `maxByteLength` is set to the smallest value possible for your use case. It should never exceed `1073741824` (1GB), to reduce the risk of out-of-memory errors.

