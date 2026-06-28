# Fringe Cases

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if:
    - The {{domxref("CustomElementRegistry")}} already contains an entry with the same name or the same constructor (or is otherwise already defined).
    - The `extends` option is specified and it is a [valid custom element name](#valid_custom_element_names) (i.e., you're trying to extend a custom element).
    - The `extends` option is specified but the element it is trying to extend is an unknown element.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if the provided [name](#name) is not a [valid custom element name](#valid_custom_element_names).
- {{jsxref("TypeError")}}
  - : Thrown if the referenced constructor is not a constructor.

