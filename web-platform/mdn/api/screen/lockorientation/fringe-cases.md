# Fringe Cases

## Warnings & Notes

> [!WARNING]
> This feature is deprecated and should be avoided. Use the {{DOMxRef("ScreenOrientation.lock()")}} method instead.

> [!NOTE]
> This method only works for installed Web apps or for Web pages
> in [fullscreen mode](/en-US/docs/Web/API/Fullscreen_API).

> [!NOTE]
> It's possible to set several locks at the same time. So, if
> the lock is set for only one orientation, the screen orientation will never change
> until the screen orientation is unlocked. Otherwise, the screen orientation will
> change from an orientation to another as long as the orientations are amongst the
> orientations the device has been locked to.

