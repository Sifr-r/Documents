# Fringe Cases

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if this `CustomElementRegistry` is not scoped (i.e., not created with `new CustomElementRegistry()`) and either `root` is a {{domxref("Document")}} node or `root`'s node document's {{domxref("Document.customElementRegistry", "customElementRegistry")}} is not this `CustomElementRegistry`.

