# Fringe Cases

## Warnings & Notes

> [!NOTE]
> There cannot be a line terminator between `async` and `function`, otherwise a semicolon is [automatically inserted](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion), causing `async` to become an identifier and the rest to become a `function` declaration.

> [!NOTE]
> The `await` keyword is only valid inside async functions within regular JavaScript code. If you use it outside of an async function's body, you will get a {{jsxref("SyntaxError")}}.
>
> `await` can be used on its own with [JavaScript modules.](/en-US/docs/Web/JavaScript/Guide/Modules)

> [!NOTE]
> The purpose of `async`/`await` is to simplify the syntax
> necessary to consume promise-based APIs. The behavior
> of `async`/`await` is similar to combining [generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) and
> promises.

> [!WARNING]
> The functions `sequentialWait` and `concurrent1`
> are not functionally equivalent.
>
> In `sequentialWait`, if promise `fast` rejects before promise
> `slow` is fulfilled, then an unhandled promise rejection error will be
> raised, regardless of whether the caller has configured a catch clause.
>
> In `concurrent1`, `Promise.all` wires up the promise
> chain in one go, meaning that the operation will fail-fast regardless of the order of
> rejection of the promises, and the error will always occur within the configured
> promise chain, enabling it to be caught in the normal way.

