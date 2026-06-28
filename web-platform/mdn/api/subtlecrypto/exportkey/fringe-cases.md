# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can [try the working examples](https://mdn.github.io/dom-examples/web-crypto/export-key/index.html) out on GitHub.

## Exceptions

The promise is rejected when one of the following exceptions is encountered:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Raised when trying to export a non-extractable key.
- `NotSupported` {{domxref("DOMException")}}
  - : Raised when trying to export in an unknown format.
- {{jsxref("TypeError")}}
  - : Raised when trying to use an invalid format.

