# Fringe Cases

## Warnings & Notes

> [!WARNING]
> You should rarely find yourself using `Boolean` as a constructor.

> [!NOTE]
> A legacy behavior makes [`document.all`](/en-US/docs/Web/API/Document/all) return `false` when used as a boolean, despite it being an object. This property is legacy and non-standard and should not be used.

> [!NOTE]
> Unlike other type conversions like [string coercion](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) or [number coercion](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), boolean coercion does not attempt to [convert objects to primitives](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) by calling user methods.

