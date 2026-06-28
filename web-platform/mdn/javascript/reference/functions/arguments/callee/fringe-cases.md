# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Accessing `arguments.callee` in [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) will throw a {{jsxref("TypeError")}}. If a function must reference itself, either give the [function expression](/en-US/docs/Web/JavaScript/Reference/Operators/function) a name or use a [function declaration](/en-US/docs/Web/JavaScript/Reference/Statements/function).

> [!NOTE]
> `callee` is a data property only in non-strict functions with simple parameters (in which case the `arguments` object is also [auto-syncing](/en-US/docs/Web/JavaScript/Reference/Functions/arguments#assigning_to_indices)). Otherwise, it is an accessor property whose getter and setter both throw a {{jsxref("TypeError")}}.

> [!NOTE]
> This method allocates a new closure for every iteration, which may significantly increase memory usage. It's only here to demonstrate the possibility, but should be avoided in production. Use a temporary variable or a named function expression instead.

