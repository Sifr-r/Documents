# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Changing the `[[Prototype]]` of an object is, by the nature of how modern JavaScript engines optimize property accesses, currently a very slow operation in every browser and JavaScript engine. In addition, the effects of altering inheritance are subtle and far-flung, and are not limited to the time spent in the `Object.setPrototypeOf(...)` statement, but may extend to **_any_** code that has access to any object whose `[[Prototype]]` has been altered. You can read more in [JavaScript engine fundamentals: optimizing prototypes](https://mathiasbynens.be/notes/prototypes).
>
> Because this feature is a part of the language, it is still the burden on engine developers to implement that feature performantly (ideally). Until engine developers address this issue, if you are concerned about performance, you should avoid setting the `[[Prototype]]` of an object. Instead, create a new object with the desired `[[Prototype]]` using {{jsxref("Object.create()")}}.

> [!WARNING]
> It is not advisable to use `setPrototypeOf()` instead of `extends` due to performance and readability reasons.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown in one of the following cases:
    - The `obj` parameter is `undefined` or `null`.
    - The `obj` parameter is [non-extensible](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible), or it's an [immutable prototype exotic object](https://tc39.es/ecma262/multipage/ordinary-and-exotic-objects-behaviours.html#sec-immutable-prototype-exotic-objects), such as `Object.prototype` or [`window`](/en-US/docs/Web/API/Window). However, the error is not thrown if the new prototype is the same value as the original prototype of `obj`.
    - The `prototype` parameter is not an object or [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

