# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Despite the obvious similarities between these methods and the
> global {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}} function
> provided by the `Window` interface, you _must not_ treat these as
> interchangeable. There is _no_ guarantee that the latter will work at all while
> an immersive XR session is underway.

> [!NOTE]
> A real application should check that the device and the User
> Agent support WebXR API at all and then that they both support the desired session
> type via {{DOMxRef("XRSystem.isSessionSupported()")}}.

