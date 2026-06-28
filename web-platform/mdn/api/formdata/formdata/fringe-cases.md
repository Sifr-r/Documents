# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Only successful form controls are included in a FormData object, i.e., those with a name and not in a disabled state.

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the specified `submitter` is not a {{Glossary("submit button")}}.
- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if the specified `submitter` isn't a member of the `form`. The `submitter` must be either a
    descendant of the form element or must have a [`form`](/en-US/docs/Web/HTML/Reference/Elements/input#form)
    attribute referring to the form.

