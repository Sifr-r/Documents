# Fringe Cases

## Warnings & Notes

> [!NOTE]
> HID devices are not opened automatically. Therefore, a {{domxref("HIDDevice")}} returned by {{domxref("HID.requestDevice()")}} must be opened with this method before it is available to transfer data.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the connection is already open.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if the attempt to open the connection fails for any reason.

