# Fringe Cases

## Warnings & Notes

> [!NOTE]
> These performance characteristics may improve as browsers optimize `:has()` implementations, but the fundamental constraints remain: `:has()` needs to traverse a whole subtree, so you need to minimize the subtree's size. In a selector like `A:has(B)`, make sure your `A` does not have too many children, and make sure your `B` is tightly constrained to avoid unnecessary traversal.

