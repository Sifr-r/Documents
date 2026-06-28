# Fringe Cases

## Exceptions

- {{jsxref("SuppressedError")}}
  - : Thrown if multiple disposers in the stack threw an error. If only one error is thrown, it is rethrown as-is. Otherwise, for each additional error, a new {{jsxref("SuppressedError")}} is created, with the original error as the `suppressed` property, and the new error as the `error` property.

