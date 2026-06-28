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

| **Type**       | **Description**                                                                                                                |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `DOMException` | An `INVALID_ACCESS_ERR` is raised if the attached property can't return an RGB color value (i.e., this is not `CSS_RGBCOLOR`). |

