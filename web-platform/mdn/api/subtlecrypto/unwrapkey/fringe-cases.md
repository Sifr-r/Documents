# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can [try the working examples](https://mdn.github.io/dom-examples/web-crypto/unwrap-key/index.html) on GitHub.

## Exceptions

The promise is rejected when one of the following exceptions is encountered:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Raised when the unwrapping key is not a key for the requested unwrap algorithm or if the `keyUsages` value of that key doesn't contain `unwrap`.
- `NotSupported` {{domxref("DOMException")}}
  - : Raised when trying to use an algorithm that is either unknown or isn't suitable for encryption or wrapping.
- `SyntaxError` {{domxref("DOMException")}}
  - : Raised when `keyUsages` is empty but the unwrapped key is of type `secret` or `private`.
- {{jsxref("TypeError")}}
  - : Raised when trying to use an invalid format.

