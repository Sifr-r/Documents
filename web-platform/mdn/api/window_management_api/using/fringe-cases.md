# Fringe Cases

## Warnings & Notes

> [!NOTE]
> You can gate functionality based on whether the user has more than one screen available using the {{domxref("Screen.isExtended", "Window.screen.isExtended")}} property. This returns `true` if the device has multiple screens, and `false` if not.

> [!NOTE]
> In our experiments, the {{domxref("Window.setInterval", "setInterval()")}} polling method shown above seemed to work best for detecting window closure in the case of multiple windows. Using events such as {{domxref("Window/beforeunload_event", "beforeunload")}}, {{domxref("Window/pagehide_event", "pagehide")}}, or {{domxref("Document/visibilitychange_event", "visibilitychange")}} proved unreliable because, when opening multiple windows at the same time, the rapid shift in focus/visibility seemed to fire the handler function prematurely.

> [!NOTE]
> One concern with the above example is that it uses constant values to represent the size of the Chrome window UI portions in the calculations — `WINDOW_CHROME_X` and `WINDOW_CHROME_Y` — to get the window size calculations correct. To create precisely-sized windows on other future implementations of the API, you'd need to keep a small library of browser chrome sizes, and employ browser detection to discover which browser is rendering your app and choose the correct size for calculations. Or you can rely on less precise window sizes.

