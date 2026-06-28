# Fringe Cases

## Exceptions

- {{jsxref('TypeError')}}
  - : Thrown in any of the following circumstances:
    - The `options` are configured such that nothing will actually be monitored.
      (For example, if `childList`, `attributes`, and `characterData` are all `false`.)
    - The value of `options.attributes` is `false` (indicating that attribute changes are not to be monitored), but `attributeOldValue` is `true` and/or
      `attributeFilter` is present.
    - The `characterDataOldValue` option is `true` but `characterData` is `false` (indicating that character changes are not to be monitored).

