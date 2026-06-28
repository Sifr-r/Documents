# Fringe Cases

## Exceptions

A {{jsxref("TypeError")}} is thrown,

- if `layer` is not in the [session's `layer` array](/en-US/docs/Web/API/XRSession/updateRenderState#setting_the_layers_array).
- if `layer` is a {{domxref("XRProjectionLayer")}}.
- if the layer's [`layout`](/en-US/docs/Web/API/XRCompositionLayer/layout) property is `default`.
- if the layer's [`layout`](/en-US/docs/Web/API/XRCompositionLayer/layout) property is `stereo` and `eye` is `none`.

