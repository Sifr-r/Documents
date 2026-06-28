# Fringe Cases

## Exceptions

Rather than throwing true exceptions, `requestLightProbe()` rejects the
returned promise with a {{domxref("DOMException")}}, specifically, one of the following:

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if `lighting-estimation` is not an enabled feature in {{domxref("XRSystem.requestSession()")}} or if the `reflectionFormat` is not `srgb8` or the `preferredReflectionFormat`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the session has already ended.

