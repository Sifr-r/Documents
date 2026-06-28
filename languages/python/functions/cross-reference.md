# Python Functions — Cross-Reference

## JavaScript — Functions

*   **Lambdas**: Python's `lambda` is restricted to a single expression. JavaScript's equivalent is the arrow function `() => {}`, which can be a single expression or contain a full statement block.
*   **Context**: Python explicitly passes the instance as `self` in methods, avoiding JavaScript's notorious `this` binding context loss.
*   **Decorators**: Python has first-class decorators (`@decorator`). JavaScript decorators are still an evolving proposal and behave slightly differently (mostly used in classes).
*   **Default Arguments**: Python evaluates default arguments at *definition* time, leading to the mutable default trap. JavaScript evaluates them at *call* time, so `function(arr = [])` is safe in JS.

[See JavaScript Functions](../../javascript/functions/README.md)
