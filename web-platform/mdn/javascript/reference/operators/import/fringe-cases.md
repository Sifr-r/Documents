# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `import()` never synchronously throws an error.

> [!WARNING]
> Do not export a function called `then()` from a module. This will cause the module to behave differently when imported dynamically than when imported statically.

