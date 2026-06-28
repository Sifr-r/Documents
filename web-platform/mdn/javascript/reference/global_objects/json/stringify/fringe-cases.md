# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When parsing JSON generated with `replacer` functions, you would likely want to use the [`reviver`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse#using_the_reviver_parameter) parameter to perform the reverse operation.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown in one of the following cases:
    - `value` contains a circular reference.
    - A {{jsxref("BigInt")}} value is encountered.

