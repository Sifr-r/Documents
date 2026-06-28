# Fringe Cases

## Warnings & Notes

> [!NOTE]
> No modern JavaScript engine uses reference-counting for garbage collection anymore.

> [!WARNING]
> This is not a polyfill, nor is it anywhere close to how it's implemented in the engine (which hooks into the garbage collection mechanism).

> [!NOTE]
> `WeakRef` and `FinalizationRegistry` offer direct introspection into the garbage collection machinery. [Avoid using them where possible](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakRef#avoid_where_possible) because the runtime semantics are almost completely unguaranteed.

