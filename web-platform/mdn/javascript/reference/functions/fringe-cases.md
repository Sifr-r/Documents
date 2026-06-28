# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Not all callable values are `instanceof Function`. For example, the `Function.prototype` object is callable but not an instance of `Function`. You can also manually set the [prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) of your function so it no longer inherits from `Function.prototype`. However, such cases are extremely rare.

> [!NOTE]
> Constructors called with [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) have a different set of logic to determine their return values.

