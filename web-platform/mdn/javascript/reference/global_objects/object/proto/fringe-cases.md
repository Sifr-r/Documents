# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Changing the `[[Prototype]]` of an object is, by the nature of how modern JavaScript engines optimize property accesses, currently a very slow operation in every browser and JavaScript engine. In addition, the effects of altering inheritance are subtle and far-flung, and are not limited to the time spent in the `obj.__proto__ = ...` statement, but may extend to **_any_** code that has access to any object whose `[[Prototype]]` has been altered. You can read more in [JavaScript engine fundamentals: optimizing prototypes](https://mathiasbynens.be/notes/prototypes).

> [!NOTE]
> The use of `__proto__` is controversial and discouraged. Its existence and exact behavior have only been standardized as a legacy feature to ensure web compatibility, while it presents several [security issues](/en-US/docs/Web/Security/Attacks/Prototype_pollution) and footguns. For better support, prefer {{jsxref("Object.getPrototypeOf()")}}/{{jsxref("Reflect.getPrototypeOf()")}} and {{jsxref("Object.setPrototypeOf()")}}/{{jsxref("Reflect.setPrototypeOf()")}} instead.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if attempting to set the prototype of a [non-extensible](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible) object or an [immutable prototype exotic object](https://tc39.es/ecma262/multipage/ordinary-and-exotic-objects-behaviours.html#sec-immutable-prototype-exotic-objects), such as `Object.prototype` or [`window`](/en-US/docs/Web/API/Window).

