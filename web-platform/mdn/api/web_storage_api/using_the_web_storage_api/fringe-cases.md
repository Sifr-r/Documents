# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You should always use the Web Storage API (`setItem()`, `getItem()`, `removeItem()`, `key`, `length`) instead of direct object property access such as `localStorage.key = value` or `localStorage["key"] = value`.
> This avoids the pitfalls of passing an object, such as colliding with native built-in methods (like `.clear()` or `.getItem()`), unexpected data leaks from prototype inheritance, and security vulnerabilities like prototype pollution when handling untrusted user input.

> [!NOTE]
> As well as viewing the example pages live using the above links, you can also [check out the source code](https://github.com/mdn/dom-examples/tree/main/web-storage).

> [!NOTE]
> You could also use {{domxref("Storage.length")}} to test whether the storage object is empty or not.

