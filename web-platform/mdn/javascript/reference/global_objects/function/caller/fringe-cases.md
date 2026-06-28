# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), accessing `caller` of a function throws an error — the API is removed with no replacement. This is to prevent code from being able to "walk the stack", which both poses security risks and severely limits the possibility of optimizations like inlining and tail-call optimization. For more explanation, you can read [the rationale for the deprecation of `arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee#description).

