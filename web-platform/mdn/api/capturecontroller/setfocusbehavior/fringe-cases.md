# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if:
    - The capture stream has been stopped.
    - The user chose to share a screen ({{domxref("MediaTrackSettings.displaySurface", "displaySurface")}} type `monitor`) rather than a `browser` tab or `window` — you can't focus a monitor. In this case the exception is thrown after the {{domxref("MediaDevices.getDisplayMedia()")}} `Promise` resolves.
    - Enough time has elapsed after the {{domxref("MediaDevices.getDisplayMedia()")}} `Promise` fulfills that the focus behavior has been finalized.

