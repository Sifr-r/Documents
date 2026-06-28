# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the passed parameter is not an iterable or async iterable (does not define the `[Symbol.iterator]()` or `[Symbol.asyncIterator]()` method).
    Also thrown if, during iteration, the result of the next step is not an object or is a promise that does not resolve to an object.

