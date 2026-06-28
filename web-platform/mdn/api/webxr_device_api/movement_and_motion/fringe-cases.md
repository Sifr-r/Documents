# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This example always displays what it renders on the screen, even if using `immersive-vr` mode. This lets you compare any differences in rendering between the two modes, and lets you see output from immersive mode even if you don't have a headset.

> [!NOTE]
> In this example, we're visually presenting the frame both on the XR device _and_ on the screen. To ensure that the on-screen canvas is the right size to allow us to do this, we set its width to be equal to the individual {{domxref("XRView")}} width multiplied by the number of views; the canvas height is always the same as the viewport's height. The two lines of code that adjust the canvas size are not needed in regular WebXR rendering loops.

