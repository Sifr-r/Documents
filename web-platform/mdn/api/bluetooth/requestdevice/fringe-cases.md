# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Even though the `options` argument is technically optional, in order to return any results you must either set a value for `filters` or set `acceptAllDevices` to `true`.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the provided `options` do not make sense.
    For example, if `options.filters` is present and `options.acceptAllDevices` is `true`, `options.filters` is not present and `options.acceptAllDevices` is `false`, or `options.filters` is `[]`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if there is no Bluetooth device that matches the specified options.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if this operation is not permitted in this context due to [security concerns](/en-US/docs/Web/API/Web_Bluetooth_API#security_considerations), such as being called from an insecure origin.

