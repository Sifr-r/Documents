# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The `compile()` method is only specified for compatibility reasons. Using `compile()` causes the otherwise immutable regex source and flags to become mutable, which may break user expectations. You can use the [`RegExp()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp) constructor to construct a new regular expression object instead.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the `this` value is not an instance of the current realm's `RegExp` constructor.
    This includes a subclass of `RegExp` and the `RegExp` constructor from a different realm.

