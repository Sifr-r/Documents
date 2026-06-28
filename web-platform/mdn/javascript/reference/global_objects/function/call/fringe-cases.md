# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This function is almost identical to {{jsxref("Function/apply", "apply()")}}, except that the function arguments are passed to `call()` individually as a list, while for `apply()` they are combined in one object, typically an array — for example, `func.call(this, "eat", "bananas")` vs. `func.apply(this, ["eat", "bananas"])`.

> [!WARNING]
> Do not use `call()` to chain constructors (for example, to implement inheritance). This invokes the constructor function as a plain function, which means [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) is `undefined`, and classes throw an error because they can't be called without [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Use {{jsxref("Reflect.construct()")}} or [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends) instead.

