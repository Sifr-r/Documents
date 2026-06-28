# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can [try the working examples](https://mdn.github.io/dom-examples/web-crypto/wrap-key/index.html) out on GitHub.

## Exceptions

The promise is rejected when one of the following exceptions is encountered:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Raised when the wrapping key is not a key for the requested wrap algorithm.
- `NotSupported` {{domxref("DOMException")}}
  - : Raised when trying to use an algorithm that is either unknown or isn't suitable for
    encryption or wrapping.
- {{jsxref("TypeError")}}
  - : Raised when trying to use an invalid format.

