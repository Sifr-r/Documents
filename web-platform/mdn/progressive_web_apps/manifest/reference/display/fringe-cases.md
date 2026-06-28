# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > The `fullscreen` value of the manifest's `display` member works separately from the [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API). The `fullscreen` display mode changes the state of the entire browser window to full screen, while the Fullscreen API only makes a specific element within the window go full screen. Therefore, a web app can be in `fullscreen` display mode while {{DOMxRef("Document.fullscreenElement")}} is `null` and {{DOMxRef("Document.fullscreenEnabled")}} is `false`.

> [!NOTE]
> The value of the `display-mode` media feature reflects the actual `display` mode being used by the browser.
> This might differ from the mode requested in the manifest, because the browser might not support the requested mode.

