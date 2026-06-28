# Fringe Cases

## Warnings & Notes

> [!WARNING]
> Referring to `this` before calling `super()` will throw an error.

> [!NOTE]
> `globalThis` is generally the same concept as the global object (i.e., adding properties to `globalThis` makes them global variables) — this is the case for browsers and Node — but hosts are allowed to provide a different value for `globalThis` that's unrelated to the global object.

> [!NOTE]
> Classes are always in strict mode. Calling methods with an undefined `this` will throw an error if the method tries to access properties on `this`.
>
> ```js example-bad
> const carSayHi = car.sayHi;
> carSayHi(); // TypeError because the 'sayHi' method tries to access 'this.name', but 'this' is undefined in strict mode.
> ```

