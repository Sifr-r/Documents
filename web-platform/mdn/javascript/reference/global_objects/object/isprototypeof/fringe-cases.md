# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `isPrototypeOf()` differs from the [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) operator. In the expression `object instanceof AFunction`, `object`'s prototype chain is checked against `AFunction.prototype`, not against `AFunction` itself.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if `this` is `null` or `undefined` (because it can't be [converted to an object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#object_coercion)).

