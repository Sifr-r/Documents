# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In order for `valueOf` to be useful during type conversion, it must return a primitive. Because all primitive types have their own `valueOf()` methods, calling `primitiveValue.valueOf()` generally does not invoke `Object.prototype.valueOf()`.

