# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Iterator()` can only be constructed with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Attempting to call it without `new` throws a {{jsxref("TypeError")}}. In addition, `Iterator()` cannot actually be constructed itself — it's usually implicitly constructed through [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super) calls inside the constructor of a subclass.

## Exceptions

- {{jsxref("TypeError")}}
  - : When [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) is the `Iterator` function itself, i.e., when the `Iterator` constructor itself is constructed.

