# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If you run this example in [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), the `this` parameter of `retrieveX` will be bound to `undefined` instead of `globalThis`, causing the `retrieveX()` call to fail.
>
> If you run this example in an ECMAScript module, top-level `this` will be bound to `undefined` instead of `globalThis`, causing the `this.x = 9` assignment to fail.
>
> If you run this example in a Node CommonJS module, top-level `this` will be bound to `module.exports` instead of `globalThis`. However, the `this` parameter of `retrieveX` will still be bound to `globalThis` in non-strict mode and to `undefined` in strict mode. Therefore, in non-strict mode (the default), the `retrieveX()` call will return `undefined` because `this.x = 9` is writing to a different object (`module.exports`) from what `getX` is reading from (`globalThis`).

