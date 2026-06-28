# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The existence of `[Symbol.species]` allows execution of arbitrary code and may create security vulnerabilities. It also makes certain optimizations much harder. Engine implementers are [investigating whether to remove this feature](https://github.com/tc39/proposal-rm-builtin-subclassing). Avoid relying on it if possible.

> [!NOTE]
> Due to a bug in both [SpiderMonkey](https://bugzil.la/1640194) and V8, the content type match is not checked. Only Safari will throw a {{jsxref("TypeError")}} in the second example.

