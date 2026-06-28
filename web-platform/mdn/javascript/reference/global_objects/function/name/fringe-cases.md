# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In non-standard, pre-ES2015 implementations the `configurable` attribute was `false` as well.

> [!WARNING]
> JavaScript will set the function's `name` property only if a function does not have an own property called `name`. However, classes' [static members](/en-US/docs/Web/JavaScript/Reference/Classes/static) will be set as own properties of the class constructor function, and thus prevent the built-in `name` from being applied. See [an example](#telling_the_constructor_name_of_an_object) below.

> [!WARNING]
> Be careful when using the `name` property with source-code transformations, such as those carried out by JavaScript compressors (minifiers) or obfuscators. These tools are often used as part of a JavaScript build pipeline to reduce the size of a program prior to deploying it to production. Such transformations often change a function's name at build time.

