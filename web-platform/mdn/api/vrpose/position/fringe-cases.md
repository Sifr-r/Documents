# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This property was part of the old [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/). It has been superseded by the [WebXR Device API](https://immersive-web.github.io/webxr/).

> [!NOTE]
> By default, all positions are given as a sitting space position. Transforming this point with {{domxref("VRStageParameters.sittingToStandingTransform")}} — when you are working with a room display for example — converts this to a standing space position.

> [!NOTE]
> User agents may provide emulated position values through techniques such as neck modeling; when doing so they should still report {{domxref("VRDisplayCapabilities.hasPosition")}} as false.

