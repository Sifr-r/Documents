# Fringe Cases

## Exceptions

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Thrown if either of the following are true:
    - The [`target`](#target) value is not a valid [XML name](https://www.w3.org/TR/xml/#dt-name); for example, it starts with a number, hyphen, or period, or contains characters other than alphanumeric characters, underscores, hyphens, or periods.
    - The _closing processing instruction sequence_ (`?>`) is part of the [`data`](#data) value.

