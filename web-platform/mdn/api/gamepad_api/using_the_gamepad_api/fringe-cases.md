# Fringe Cases

## Warnings & Notes

> [!NOTE]
> In Firefox, gamepads are only exposed to a page when the user interacts with one with the page visible. This helps prevent gamepads from being used for [fingerprinting](/en-US/docs/Glossary/Fingerprinting) the user. Once one gamepad has been interacted with, other gamepads that are connected will automatically be visible.

> [!NOTE]
> The Gamepad object is available on the {{ domxref("Window/gamepadconnected_event", "gamepadconnected") }} event rather than the {{ domxref("Window") }} object itself, for security reasons. You can also access gamepads through {{domxref("Navigator.getGamepads()")}}. In practice, you should poll {{domxref("Navigator.getGamepads()")}} and read the current object for a known `index` each frame, rather than relying on a long-lived reference from an earlier event.

