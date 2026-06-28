# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If you are making a library, you should prefer to use error cause to discriminate between different errors emitted — rather than asking your consumers to parse the error message. See the [error cause page](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause#providing_structured_data_as_the_error_cause) for an example.

> [!WARNING]
> Builtin subclassing cannot be reliably transpiled to pre-ES6 code, because there's no way to construct the base class with a particular `new.target` without {{jsxref("Reflect.construct()")}}. You need [additional configuration](https://github.com/loganfsmyth/babel-plugin-transform-builtin-extend) or manually call {{jsxref("Object/setPrototypeOf", "Object.setPrototypeOf(this, CustomError.prototype)")}} at the end of the constructor; otherwise, the constructed instance will not be a `CustomError` instance. See [the TypeScript FAQ](https://github.com/microsoft/TypeScript/wiki/FAQ#why-doesnt-extending-built-ins-like-error-array-and-map-work) for more information.

> [!NOTE]
> Some browsers include the `CustomError` constructor in the stack trace when using ES2015 classes.

