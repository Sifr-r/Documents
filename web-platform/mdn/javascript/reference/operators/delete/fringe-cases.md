# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The syntax allows a wider range of expressions following the `delete` operator, but only the above forms lead to meaningful behaviors.

> [!NOTE]
> The following example uses non-strict-mode only features, like implicitly creating global variables and deleting identifiers, which are forbidden in strict mode.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown in [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) if the property is an own non-configurable property.
- {{jsxref("ReferenceError")}}
  - : Thrown if `object` is [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super).

