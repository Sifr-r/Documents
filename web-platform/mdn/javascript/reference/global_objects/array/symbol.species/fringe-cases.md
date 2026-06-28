# Fringe Cases

## Warnings & Notes

> [!WARNING]
> The existence of `[Symbol.species]` allows execution of arbitrary code and may create security vulnerabilities. It also makes certain optimizations much harder. Engine implementers are [investigating whether to remove this feature](https://github.com/tc39/proposal-rm-builtin-subclassing). Avoid relying on it if possible. Modern array methods, such as {{jsxref("Array/toReversed", "toReversed()")}}, do not use `[Symbol.species]` and always return a new `Array` base class instance.

