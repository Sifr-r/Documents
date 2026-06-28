# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > To set all flags to `false`, indicating that this element passes all constraints validation, pass in an empty object `{}`. In this case, you do not need to also pass a `message`.

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the element does not have its `formAssociated` property set to `true`.
- {{jsxref("TypeError")}}
  - : Thrown if one or more `flags` is `true`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if `anchor` is given, but the anchor is not a shadow-including descendant of the element.

