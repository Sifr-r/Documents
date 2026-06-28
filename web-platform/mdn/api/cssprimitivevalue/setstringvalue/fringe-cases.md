# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This method was part of an attempt to create a typed CSS Object Model. This attempt has been abandoned, and most browsers do
> not implement it.
>
> To achieve your purpose, you can use:
>
> - the untyped [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model), widely supported, or
> - the modern [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API), less supported and considered experimental.

## Exceptions

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Thrown if the CSS value doesn't contain a string value
    or if the string value can't be converted into the specified unit.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Thrown if the property is read-only.

