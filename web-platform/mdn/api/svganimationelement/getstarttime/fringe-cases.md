# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the `SVGAnimationElement` has no current interval. This happens when the animation element's {{SVGAttr("begin")}} time has not been reached or defined, thus the `getStartTime()` method cannot determine a valid start time. An example can be when the animation is set to start at `begin="click"`, but the user has not yet clicked to trigger it.

