# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If a user has exited pointer lock via the [default unlock gesture](https://w3c.github.io/pointerlock/#dfn-default-unlock-gesture), or pointer lock has not previously been entered for this document, an event generated as a result of an [engagement gesture](https://w3c.github.io/pointerlock/#dfn-engagement-gesture) must be received by the document before [`requestPointerLock`](https://w3c.github.io/pointerlock/#dom-element-requestpointerlock) will succeed. (from <https://w3c.github.io/pointerlock/#extensions-to-the-element-interface>)

> [!NOTE]
> The above snippet works in browsers that don't support the promise version of `requestPointerLock()`. See [Handling promise and non-promise versions of requestPointerLock()](#handling_promise_and_non-promise_versions_of_requestpointerlock) for an explanation.

