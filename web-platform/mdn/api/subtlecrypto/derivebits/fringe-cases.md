# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can [try the working examples](https://mdn.github.io/dom-examples/web-crypto/derive-bits/index.html) on GitHub.

## Exceptions

The promise is rejected when one of the following exceptions are encountered:

- `OperationError` {{domxref("DOMException")}}
  - : Raised if the _length_ parameter of the `deriveBits()` call is null, and also in some cases if the _length_ parameter is not a multiple of 8.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Raised when the base key is not a key for the requested derivation algorithm or if
    the [`CryptoKey.usages`](/en-US/docs/Web/API/CryptoKey) value of that key doesn't contain
    `deriveBits`.
- `NotSupported` {{domxref("DOMException")}}
  - : Raised when trying to use an algorithm that is either unknown or isn't suitable for
    derivation.

