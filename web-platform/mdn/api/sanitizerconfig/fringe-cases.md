# Fringe Cases

## Warnings & Notes

> [!NOTE]
  > It is impossible to define per-element attributes if the `removeElements` array is defined, because these are added to elements in the `elements` array.

> [!NOTE]
> The conditions above are from the perspective of a web developer.
> The [validity check defined in the specification](https://html.spec.whatwg.org/multipage/dynamic-markup-insertion.html#dom-sanitizerconfig-valid) is slightly different because it is executed after canonicalization of the configuration, such as adding `removeElements` when both are missing, and adding default namespaces.

