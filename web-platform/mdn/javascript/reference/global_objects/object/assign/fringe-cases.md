# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Object.assign()` does not throw on [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) or {{jsxref("undefined")}} sources.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown in one of the following cases:
    - The `target` parameter is [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) or {{jsxref("undefined")}}.
    - Assignment of a property on the target object fails; for example, because the property is non-writable on the target object, or because its setter throws an error.


```js
const target = Object.defineProperty({}, "foo", {
  value: 1,
  writable: false,
}); // target.foo is a read-only property

Object.assign(target, { bar: 2 }, { foo2: 3, foo: 3, foo3: 3 }, { baz: 4 });
// TypeError: "foo" is read-only
// The Exception is thrown when assigning target.foo

console.log(target.bar); // 2, the first source was copied successfully.
console.log(target.foo2); // 3, the first property of the second source was copied successfully.
console.log(target.foo); // 1, exception is thrown here.
console.log(target.foo3); // undefined, assign method has finished, foo3 will not be copied.
console.log(target.baz); // undefined, the third source will not be copied either.
```

