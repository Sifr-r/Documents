# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can [try the working examples](https://mdn.github.io/dom-examples/web-crypto/encrypt-decrypt/index.html) on GitHub.

## Exceptions

The promise is rejected when the following exception is encountered:

- `SyntaxError` {{domxref("DOMException")}}
  - : Raised when the result is a {{domxref("CryptoKey")}} of type `secret` or `private` but `keyUsages` is empty, or invalid for the algorithm type.
- `SyntaxError` {{domxref("DOMException")}}
  - : Raised when the result is a {{domxref("CryptoKeyPair")}} and its `privateKey.usages` attribute is empty, or invalid for the algorithm type.

