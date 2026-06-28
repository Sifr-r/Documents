# JavaScript Functions — Cross-Reference

## Python — Functions and Lambdas

*   **Arrow Functions (`=>`)**: The closest equivalent in Python is the `lambda` function. However, Python lambdas are restricted to a single expression, whereas JS arrow functions can contain block statements `{}`.
*   **Context (`this`)**: JavaScript relies heavily on implicit `this` binding which can change based on how a function is called. Python requires an explicit `self` parameter in method definitions, avoiding many of the `this` binding fringe cases found in JS.
*   **Rest Parameters (`...args`)**: Equivalent to Python's `*args`.
*   **Default Parameters**: JS evaluates defaults at call time. Python evaluates them at definition time (which can lead to mutable default bugs).

[See Python Functions](../../python/functions/README.md)
