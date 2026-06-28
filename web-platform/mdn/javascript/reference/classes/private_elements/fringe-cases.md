# Fringe Cases

## Warnings & Notes

> [!NOTE]
> On MDN, we avoid using the term "private property". A [property](/en-US/docs/Glossary/Property/JavaScript) in JavaScript has a string or symbol key, and has attributes like `writable`, `enumerable`, and `configurable`, but private elements have none. While private elements are accessed with the familiar dot notation, they cannot be [proxied](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy), enumerated, deleted, or interacted with using any {{jsxref("Object")}} method.

> [!NOTE]
> Code run in the Chrome console can access private elements outside the class. This is a DevTools-only relaxation of the JavaScript syntax restriction.

> [!NOTE]
> `#privateField` from the `ClassWithPrivateField` base class is private to `ClassWithPrivateField` and is not accessible from the derived `Subclass`.

> [!WARNING]
> This is a potentially very confusing thing to do. You are generally advised to avoid returning anything from the constructor — especially something unrelated to `this`.

