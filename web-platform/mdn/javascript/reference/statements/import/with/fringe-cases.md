# Fringe Cases

## Warnings & Notes

> [!NOTE]
> A previous version of this proposal used the `assert` keyword instead of `with`. The assertion feature is now non-standard. Check the [browser compatibility table](#browser_compatibility) for details.

> [!NOTE]
> JSON modules only have one default export. You cannot do named imports from them (like `import { name } from "data.json"`).

## Exceptions

- {{jsxref("SyntaxError")}}
  - : An unsupported `key` was specified in a _static import_.

- {{jsxref("TypeError")}}
  - : An unsupported `key` was specified in a _dynamic import_.

Note that specifying an unsupported value for a supported key may also result in an exception in some cases, depending on the key.

