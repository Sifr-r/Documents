# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Math.random()` _does not_ provide cryptographically secure random numbers. Do not use them for anything related to security. Use the Web Crypto API instead, and more precisely the {{domxref("Crypto.getRandomValues()")}} method.

> [!NOTE]
> It might be tempting to use [`Math.round()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round) to accomplish that, but doing so would cause your random numbers to follow a non-uniform distribution, which may not be acceptable for your needs.

