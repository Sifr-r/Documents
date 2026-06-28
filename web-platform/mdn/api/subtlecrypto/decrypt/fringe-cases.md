# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can [try the working examples](https://mdn.github.io/dom-examples/web-crypto/encrypt-decrypt/index.html) on GitHub.

## Exceptions

The promise is rejected when the following exceptions are encountered:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Raised when the requested operation is not valid for the provided key (e.g., invalid encryption algorithm, or invalid key for the specified encryption algorithm).
- `OperationError` {{domxref("DOMException")}}
  - : Raised when the operation failed for an operation-specific reason (e.g., algorithm parameters of invalid sizes, or there was an error decrypting the ciphertext).

