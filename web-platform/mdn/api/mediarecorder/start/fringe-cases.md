# Fringe Cases

## Warnings & Notes

> [!NOTE]
> If the browser is unable to start recording or continue
> recording, it will raise an {{domxref("MediaRecorder.error_event", "error")}} event, followed by a
> {{domxref("MediaRecorder.dataavailable_event", "dataavailable")}} event containing the `Blob` it
> has gathered, followed by the {{domxref("MediaRecorder/stop_event", "stop")}} event.

    > [!NOTE]
    > Like other time values in web APIs, `timeslice` is not exact and the real intervals may be slightly longer due to other pending tasks before the creation of the next blob.

## Exceptions

Errors that can be detected immediately are thrown as DOM exceptions. All other errors
are reported through {{domxref("MediaRecorder.error_event", "error")}} events sent to the `MediaRecorder`
object. You can implement the {{domxref("MediaRecorder.error_event", "onerror")}} event
handler to respond to these errors.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the `MediaRecorder` is not in the `inactive` state; you cannot
    start recording media if it is already being recorded. See the
    {{domxref("MediaRecorder.state", "state")}} property.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if:
    - The media stream you are attempting to record is inactive.
    - One or more of the stream's tracks is in a format that cannot be recorded using the current configuration
    - The `videoKeyFrameIntervalDuration` and `videoKeyFrameIntervalCount` parameter are both specified when creating the `MediaRecorder`.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("MediaStream")}} is configured to disallow recording. This may be the
    case, for example, with sources obtained using {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} when the user denies permission to use an input device. This
    exception may also be delivered as an {{domxref("MediaRecorder.error_event", "error")}} event if
    the security options for the source media change after recording begins.

