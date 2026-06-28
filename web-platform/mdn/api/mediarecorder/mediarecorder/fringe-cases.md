# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > If bits per second values are not specified for video and/or audio, the default adopted for video is 2.5Mbps or 10 Mbps, depending on the browser.
    > The audio default is adaptive, depending upon the sample rate and the number of channels.

    > [!NOTE]
    > Video resolution, frame rate and similar settings are specified as constraints when calling {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}, not here in the MediaStream Recording API.

## Exceptions

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if the specified MIME type is not supported by the user agent.

