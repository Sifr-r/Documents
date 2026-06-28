# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `notRestoredReasons` may return `null` despite the navigation type being reported as a back/forward navigation. These circumstances include duplicating a back/forward navigation in a new tab and restoring a back/forward navigation tab after a browser restart. In such cases, some browsers copy the navigation type from the original tab, but as these are not actually back/forward navigations, `notRestoredReasons` returns `null`.

