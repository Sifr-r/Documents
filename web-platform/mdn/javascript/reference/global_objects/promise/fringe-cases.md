# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Several other languages have mechanisms for lazy evaluation and deferring a computation, which they also call "promises", e.g., Scheme. Promises in JavaScript represent processes that are already happening, which can be chained with callback functions. If you are looking to lazily evaluate an expression, consider using a function with no arguments e.g., `f = () => expression` to create the lazily-evaluated expression, and `f()` to evaluate the expression immediately.

> [!NOTE]
> For faster execution, all synchronous actions should preferably be done within one handler, otherwise it would take several ticks to execute all handlers in sequence.

> [!NOTE]
> Currently, incumbent realm tracking is fully implemented in Firefox, and has partial implementations in Chrome and Safari.

