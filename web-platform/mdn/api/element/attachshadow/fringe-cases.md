# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If manual slot assignment is not supported, a warning is displayed and the browser will use `named` assignment.
> However, because none of the light DOM elements have a `slot` attribute, they will all be inserted into the first unnamed slot (the title slot).

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : This error may be thrown when you try to attach a shadow root to an element:
    - outside the HTML namespace or that can't have a shadow attached to it.
    - where the element definition static property `disabledFeatures` has been given a value of `"shadow"`.
    - that already has a shadow root that was not created declaratively.
    - that has a [declarative shadow root](/en-US/docs/Web/HTML/Reference/Elements/template#declarative_shadow_dom) but the specified `mode` does not match the existing mode.
    - while passing a `customElementRegistry` value that isn't `null` or a locally scoped registry (that you created using `new CustomElementRegistry()`).
      The error would be thrown if you passed the global registry.

