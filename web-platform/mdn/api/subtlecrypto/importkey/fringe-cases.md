# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can [try the working examples](https://mdn.github.io/dom-examples/web-crypto/import-key/index.html) on GitHub.

## Exceptions

The promise is rejected when one of the following exceptions is encountered:

- `SyntaxError` {{domxref("DOMException")}}
  - : Raised when `keyUsages` is empty but the unwrapped key is of type `secret` or `private`.
- {{jsxref("TypeError")}}
  - : Raised when trying to use an invalid format or if the `keyData` is not suited for that format.

