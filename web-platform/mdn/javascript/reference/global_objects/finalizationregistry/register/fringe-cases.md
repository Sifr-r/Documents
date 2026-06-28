# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown in one of the following cases:
    - `target` is not an object or a [non-registered symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry) (object as opposed to primitives; functions are objects as well)
    - `target` is the same as `heldValue` (`target === heldValue`)
    - `unregisterToken` is not an object or a [non-registered symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#shared_symbols_in_the_global_symbol_registry)

