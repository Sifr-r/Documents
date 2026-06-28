# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Associated with the `repeatEvent` event is an integer that indicates which repeat iteration is beginning; this can be found in the `detail` property of the event object. The value is a 0-based integer, but the repeat event is not raised for the first iteration and so the observed values will be >= 1. This is supported in Firefox, but not in Chrome.

