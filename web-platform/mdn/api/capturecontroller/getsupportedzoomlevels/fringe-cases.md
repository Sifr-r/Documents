# Fringe Cases

## Warnings & Notes

> [!NOTE]
> It is generally a best practice to call `decreaseZoomLevel()` and `increaseZoomLevel()` from within a [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) block because the zoom level could be changed asynchronously by an entity other than the application, which might lead to an error being thrown. For example, the user might directly interact with the captured surface to zoom in or out.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : The capturing {{domxref("MediaStream")}} returned by the originating {{domxref("MediaDevices.getDisplayMedia()")}} call is no longer capturing, for example because the associated {{domxref("MediaStreamTrack")}} objects have had {{domxref("MediaStreamTrack.stop", "stop()")}} called on them.
- `NotSupportedError` {{domxref("DOMException")}}
  - : The surface type being captured is not a browser tab.

