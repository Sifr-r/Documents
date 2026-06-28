# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If you want a working example to play with, you can use the following template to create any function returning a promise:
>
> ```js
> function doSomething() {
>   return new Promise((resolve) => {
>     setTimeout(() => {
>       // Other things to do before completion of the promise
>       console.log("Did something");
>       // The fulfillment value of the promise
>       resolve("https://example.com/");
>     }, 200);
>   });
> }
> ```
>
> The implementation is discussed in the [Creating a Promise around an old callback API](#creating_a_promise_around_an_old_callback_api) section below.

> [!NOTE]
> Arrow function expressions can have an [implicit return](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions#function_body); so, `() => x` is short for `() => { return x; }`.

> [!NOTE]
> `async`/`await` has the same concurrency semantics as normal promise chains. `await` within one async function does not stop the entire program, only the parts that depend on its value, so other async jobs can still run while the `await` is pending.

> [!NOTE]
> If you don't have sophisticated error handling, you very likely don't need nested `then` handlers. Instead, use a flat chain and put the error handling logic at the end.

> [!NOTE]
> The text "Do this" is not displayed because the "Something failed" error caused a rejection.

