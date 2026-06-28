# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown in any of the following situations:
    - The {{domxref("XRSession")}} has already ended, so you cannot change its render state.
    - The `baseLayer` was created by an `XRSession` other than the one on which `updateRenderState()` was called.
    - The `inlineVerticalFieldOfView` option was set, but the session is immersive, and therefore, does not allow this property to be used.

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown in any of the following situations:
    - The `layers` option is used in a session that has been created without the `layers` feature.
    - Both the `baseLayer` and `layers` options are specified.

- {{jsxref("TypeError")}}
  - : Thrown if the `layers` option contains duplicate instances.

