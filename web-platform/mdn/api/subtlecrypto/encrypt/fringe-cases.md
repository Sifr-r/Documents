# Fringe Cases

## Warnings & Notes

> [!NOTE]
> See [Appendix B of the NIST SP800-38A standard](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38a.pdf#%5B%7B%22num%22%3A70%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22Fit%22%7D%5D) for more information.

> [!NOTE]
> You can [try the working examples](https://mdn.github.io/dom-examples/web-crypto/encrypt-decrypt/index.html) out on GitHub.

## Exceptions

The promise is rejected when the following exceptions are encountered:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Raised when the requested operation is not valid for the provided key (e.g., invalid encryption algorithm, or invalid key for the specified encryption algorithm).
- `OperationError` {{domxref("DOMException")}}
  - : Raised when the operation failed for an operation-specific reason (e.g., algorithm parameters of invalid sizes, or AES-GCM plaintext longer than 2<sup>39</sup>−256 bytes).

