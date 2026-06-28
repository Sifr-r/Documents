# Fringe Cases

## Warnings & Notes

> [!NOTE]
> One observable difference between `<` and `>` is the order of coercion, especially if the coercion to primitive has side effects. All comparison operators coerce the left operand before the right operand.

> [!WARNING]
> This can be a source of confusion. If your objects provide custom primitive conversion logic, make sure it is _idempotent_: multiple coercions should return the same value.

