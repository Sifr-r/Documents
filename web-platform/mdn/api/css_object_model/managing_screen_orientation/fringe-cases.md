# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The orientation media query actually applies based on the orientation of the browser window (or iframe) not the orientation of the device.

> [!NOTE]
> A screen lock is web application dependent. If application A is locked to `landscape` and application B is locked to `portrait`, switching from application A to B or B to A will not fire a `change` event on `ScreenOrientation` because both applications will keep the orientation they had.
>
> However, locking the orientation can fire a `change` event if the orientation had to be changed to satisfy the lock requirements.

