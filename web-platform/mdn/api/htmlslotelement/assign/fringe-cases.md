# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You cannot mix manually (imperative) and named (declarative, automatic) slot assignments. Therefore, for this method to work, the shadow tree needs to have been [created](/en-US/docs/Web/API/Element/attachShadow) with the `slotAssignment: "manual"` option.

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown when calling this method on an automatically assigned slot.

