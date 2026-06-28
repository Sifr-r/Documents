# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can [try the working examples](https://mdn.github.io/dom-examples/web-crypto/derive-key/index.html) on GitHub.

## Exceptions

The promise is rejected when one of the following exceptions are encountered:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Raised when the master key is not a key for the requested derivation algorithm or if the `keyUsages` value of that key doesn't contain `deriveKey`.
- `NotSupported` {{domxref("DOMException")}}
  - : Raised when trying to use an algorithm that is either unknown or isn't suitable for derivation, or if the algorithm requested for the derived key doesn't define a key length.
- `SyntaxError` {{domxref("DOMException")}}
  - : Raised when `keyUsages` is empty but the unwrapped key is of type `secret` or `private`.

