# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Raised if `initDataType` is an empty string, if `initData` is an empty array, or if the provided `initData` is not valid according to the specified `initDataType`.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Raised if the Key System implementation associated with the `MediaKeySession` object does not support the provided `initDataType`, if the sanitized initialization data is empty, or if the sanitized initialization data is not supported by the content decryption module (CDM).
- {{domxref("QuotaExceededError")}}
  - : Raised if the operation fails due to a lack of resources on the user agent or CDM.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Raised if the `MediaKeySession` object is in a `closing` or `closed` state, or if it has already been initialized.

